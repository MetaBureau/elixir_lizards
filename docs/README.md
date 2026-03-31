# Docs Index

Use this directory as the entrypoint for repo-specific guidance beyond the top-level README.

## Core Docs

- `../README.md`
  - quick start
  - verification commands
  - high-level project orientation

- `../ARCHITECTURE.md`
  - system map
  - layer boundaries
  - request and persistence flow

- `../CONTRIBUTING.md`
  - contributor workflow
  - testing expectations
  - dependency/update policy

## Reference Docs

- `REFERENCE_GUIDE.md`
  - what makes this repo "reference grade"
  - verification and dependency policy
  - documentation and testing standards

- `REFERENCE_QA.md`
  - browser/manual QA checklist for the main app, demo pages, showcases, and dev tooling
  - expected route behavior and key page anchors
  - embedded desktop and mobile visual baselines for the main reference surfaces
  - screenshot refresh workflow via `mix reference.screenshots`

- `reference-images/`
  - desktop and mobile viewport screenshots used by `REFERENCE_QA.md`
  - local visual baselines for manual regression checks

## Implementation Docs

- `COMPONENT_DEVELOPMENT.md`
  - Phoenix component patterns
  - HEEx and JS composition rules
  - DaisyUI-oriented component learnings

## Design and Planning Docs

- `rfd-ash-phoenix-ai-dag.md`
  - Ash/Phoenix AI pipeline design exploration
  - relationship guidance for `belongs_to` writes

## Suggested Reading Order

1. `../README.md`
2. `../ARCHITECTURE.md`
3. `REFERENCE_GUIDE.md`
4. `../CONTRIBUTING.md`
5. whichever implementation or RFD doc is relevant to the task
