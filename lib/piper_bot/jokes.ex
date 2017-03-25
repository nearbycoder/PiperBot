defmodule PiperBot.Jokes do
  alias Slack.Web.Chat
  
  def parse("random", message) do
    joke = RandomJokes.fetch_random_joke

    case joke do
      {:ok, %{"joke" => joke}} ->
        Chat.post_message(message.channel, joke, %{username: "Jokes", icon_url: "https://s-media-cache-ak0.pinimg.com/736x/e7/e7/bd/e7e7bdf63dbd42cd09039c4c23b78e4d.jpg"})
      {:error, _} ->
        Chat.post_message(message.channel, "Service is unavaliable try again later.", %{as_user: true})
    end
  end

  def parse(_, message) do
    Chat.post_message(message.channel, "Sorry I don't understand...", %{as_user: true})
  end
end