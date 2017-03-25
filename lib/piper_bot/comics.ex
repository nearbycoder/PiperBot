defmodule PiperBot.Comics do
  alias Slack.Web.Chat

  def parse("xkcd", message), do: Xkcd.fetch_random_xkcd |> send_xkcd(message)

  def parse("xkcd:today", message), do: Xkcd.fetch_todays_xkcd |> send_xkcd(message)

  def parse(_, message) do
    Chat.post_message(message.channel, "Sorry I don't understand...", %{as_user: true})
  end

  defp send_xkcd(xkcd, message) do
    case xkcd do
      {:ok, %{"num" => num, "img" => img, "title" => title, "month" => month, "day" => day, "year" => year}} ->
        attachments = [%{title: "#{num} - #{title} #{month}/#{day}/#{year}", image_url: img}] |> JSX.encode!
        Chat.post_message(message.channel, "", %{ username: "xkcd", icon_url: "https://pbs.twimg.com/profile_images/413359024617185280/pS8lVAWA_400x400.png", attachments: [attachments]})
      {:error, _} ->
        Chat.post_message(message.channel, "Service is unavaliable try again later.", %{as_user: true})
    end
  end
end