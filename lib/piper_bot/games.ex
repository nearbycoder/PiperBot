defmodule PiperBot.Games do
  alias Slack.Web.Chat

  def parse(command, message) do
    Chat.post_message(message.channel, "#{command}", %{as_user: true})
  end
end