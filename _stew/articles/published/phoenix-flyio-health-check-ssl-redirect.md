# The Fly.io Health Check SSL Redirect Trap: A Phoenix Deployment Saga

Deploying Phoenix to Fly.io should be straightforward. The documentation exists. The tooling is mature. Yet a single misconfiguration can send you down a rabbit hole of failed deployments, cryptic logs, and increasingly creative attempts at fixes that make things worse. This is the story of one such trap: the SSL redirect that breaks health checks.

## The Symptom

Your Phoenix app deploys successfully. The container starts. Logs show the application booting normally. Then Fly.io kills it. The health check failed. You check the logs more carefully:

```
Plug.SSL is redirecting GET /health to https://elixir-lizards.fly.dev with status 301
```

The health check endpoint exists. It returns 200 OK when you hit it in your browser. But Fly's internal health checker keeps getting 301 redirects, and after enough failures, Fly declares your app unhealthy and terminates it.

## Understanding the Architecture

Fly.io terminates SSL at their edge proxy. External users connect via HTTPS to Fly's infrastructure, which then forwards requests to your application over plain HTTP on an internal network. Your app listens on port 8080 (or whatever you configure), receiving unencrypted HTTP traffic.

This is standard reverse proxy architecture. Nginx, Caddy, and load balancers all work this way. The problem emerges when your application doesn't trust the proxy and tries to enforce HTTPS itself.

Phoenix's `force_ssl` configuration exists for exactly this scenario—ensuring users always connect securely. When configured with `rewrite_on: [:x_forwarded_proto]`, it checks the `X-Forwarded-Proto` header that proxies set to indicate the original protocol. If the header says "http", Phoenix redirects to HTTPS.

But Fly's health checker makes internal HTTP requests *without* going through the edge proxy. No `X-Forwarded-Proto` header. No indication this is a legitimate internal request. From Plug.SSL's perspective, someone is trying to access your app over plain HTTP, and the configured behaviour is to redirect them to HTTPS.

The health checker follows the redirect, but now it's hitting the HTTPS endpoint, which means it's going through Fly's edge proxy, which forwards to your app over HTTP, which sees the forwarded proto header correctly this time—but by now the health check has timed out or exceeded its redirect limit.

## The Failed Attempts

The git history tells the story of escalating desperation:

**Attempt 1: Make the health check use HTTPS**
```
commit 1e13b68 - Fix health check to use HTTPS protocol
```
This doesn't work because Fly's internal health checks are HTTP-only. You can't tell Fly to health check over HTTPS on internal networks.

**Attempt 2: Add a dedicated health endpoint**
```
commit 2067060 - Add health check endpoint
```
The endpoint was never the problem. A simple controller returning 200 OK works fine—when it's not being redirected.

**Attempt 3: Misconfigured exclude option**
```elixir
config :elixir_lizards, ElixirLizardsWeb.Endpoint,
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  exclude: [hosts: ["localhost", "127.0.0.1"]]
```
The `exclude` key was placed outside the `force_ssl` option list. It did nothing. The config was silently ignored.

**Attempt 4: Anonymous function exclude**
```elixir
force_ssl: [
  rewrite_on: [:x_forwarded_proto],
  exclude: fn conn -> conn.request_path == "/health" end
]
```
Plug.SSL doesn't accept anonymous functions for exclude. The build failed with a validation error.

## The Fix

One line. The correct syntax:

```elixir
config :elixir_lizards, ElixirLizardsWeb.Endpoint,
  force_ssl: [
    rewrite_on: [:x_forwarded_proto],
    exclude: [paths: ["/health"]]
  ]
```

The `exclude` option accepts a keyword list with `hosts:` and `paths:` keys. Paths matching `/health` skip the SSL redirect entirely. The health checker gets its 200 OK. The app stays alive.

## Why This Matters

This bug cost hours of debugging across multiple deployment attempts. Each failed deploy meant waiting for Docker builds, watching logs, trying another approach. The fix was always one web search away, but the wrong search terms led to wrong solutions.

The broader lesson: platform-specific deployment concerns often intersect with framework security defaults in unexpected ways. Phoenix's `force_ssl` is doing the right thing—protecting users from insecure connections. Fly.io's health checks are doing the right thing—verifying app health over internal networks. The conflict isn't a bug in either system. It's an integration concern that falls through the cracks of both documentations.

When deploying to any platform with SSL termination at the edge, audit every middleware that touches HTTP/HTTPS handling. Understand what headers your proxy sets, what your framework expects, and what internal services need to bypass those checks entirely.

## The Complete Configuration

For future reference, a working Fly.io + Phoenix SSL configuration:

```elixir
# config/prod.exs
config :your_app, YourAppWeb.Endpoint,
  force_ssl: [
    rewrite_on: [:x_forwarded_proto],
    exclude: [paths: ["/health"]]
  ]
```

```elixir
# lib/your_app_web/router.ex
get "/health", HealthController, :index
```

```elixir
# lib/your_app_web/controllers/health_controller.ex
defmodule YourAppWeb.HealthController do
  use YourAppWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 200, "ok")
  end
end
```

The path from broken to working was four commits and several hours. The diff that mattered was changing `exclude: fn conn -> ...` to `exclude: [paths: ["/health"]]`. Twelve characters, properly placed.
