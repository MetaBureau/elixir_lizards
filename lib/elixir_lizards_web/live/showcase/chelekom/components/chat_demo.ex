defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ChatDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Chat
  alias ElixirLizardsWeb.Components.Chelekom.Avatar

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Chat</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Chat message components for building conversational interfaces
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Chat Messages</h3>
          <div class="space-y-4">
            <Chat.chat>
              <Avatar.avatar
                src="https://i.pravatar.cc/150?img=1"
                size="large"
                rounded="full"
              />
              <Chat.chat_section>
                <div class="font-semibold">Alice</div>
                <p>Hey! How are you doing today?</p>
                <:status time="10:30 AM" />
              </Chat.chat_section>
            </Chat.chat>

            <Chat.chat position="flipped">
              <Avatar.avatar
                src="https://i.pravatar.cc/150?img=2"
                size="large"
                rounded="full"
              />
              <Chat.chat_section>
                <div class="font-semibold">You</div>
                <p>I'm doing great, thanks for asking! Working on some new components.</p>
                <:status time="10:32 AM" deliver="Delivered" />
              </Chat.chat_section>
            </Chat.chat>

            <Chat.chat>
              <Avatar.avatar
                src="https://i.pravatar.cc/150?img=1"
                size="large"
                rounded="full"
              />
              <Chat.chat_section>
                <div class="font-semibold">Alice</div>
                <p>That sounds exciting! Let me know if you need any help.</p>
                <:status time="10:33 AM" />
              </Chat.chat_section>
            </Chat.chat>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="space-y-4">
            <Chat.chat variant="default" color="primary">
              <Avatar.avatar
                src="https://i.pravatar.cc/150?img=3"
                size="large"
                rounded="full"
              />
              <Chat.chat_section>
                <div class="font-semibold">Primary</div>
                <p>This is a primary colored chat bubble.</p>
              </Chat.chat_section>
            </Chat.chat>

            <Chat.chat variant="default" color="success" position="flipped">
              <Avatar.avatar
                src="https://i.pravatar.cc/150?img=4"
                size="large"
                rounded="full"
              />
              <Chat.chat_section>
                <div class="font-semibold">Success</div>
                <p>This is a success colored chat bubble.</p>
              </Chat.chat_section>
            </Chat.chat>
          </div>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Chat.chat&gt;
    &lt;Avatar.avatar src="/images/user.jpg" size="large" rounded="full" /&gt;
    &lt;Chat.chat_section&gt;
    &lt;div class="font-semibold"&gt;Username&lt;/div&gt;
    &lt;p&gt;Message content here&lt;/p&gt;
    &lt;:status time="10:30 AM" deliver="Delivered" /&gt;
    &lt;/Chat.chat_section&gt;
    &lt;/Chat.chat&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
