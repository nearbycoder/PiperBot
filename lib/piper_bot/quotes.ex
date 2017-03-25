defmodule PiperBot.Quotes do
  alias Slack.Web.Chat
  
  def parse("chuck", message) do
    phrase = ChuckNorris.fetch_random_norris_quote
    
    case phrase do
      {:ok, %{"value" => %{"joke" => phrase}}} ->
        Chat.post_message(message.channel, phrase, %{username: "Chuck Norris", icon_url: "http://free-profile-pics.com/profile-pictures/01232014/download/chuck-norris-profile-picture-512x512.png"})
      {:error, _} ->
        Chat.post_message(message.channel, "Service is unavaliable try again later.", %{as_user: true})
    end
  end

  def parse("ron", message) do
    phrase = RonSwanson.fetch_random_ron_quote

    case phrase do
      {:ok, [phrase]} ->
        Chat.post_message(message.channel, phrase, %{username: "Ron Swanson", icon_url: "https://pbs.twimg.com/profile_images/1369149006/ronProfile_400x400.jpg"})
      {:error, _} ->
        Chat.post_message(message.channel, "Service is unavaliable try again later.", %{as_user: true})
    end
  end

  def parse("dwight", message) do
    phrase = DwightSchrute.fetch_random_dwight_quote

    Chat.post_message(message.channel, phrase, %{username: "Dwight Schrute", icon_url: "https://pbs.twimg.com/profile_images/61686081/dwightcrop_400x400.jpg"})
  end

  def parse("michael", message) do
    phrase = MichaelScott.fetch_random_michael_quote

    Chat.post_message(message.channel, phrase, %{username: "Michael Scott", icon_url: "https://v.cdn.vine.co/r/avatars/D6AAB5F2CA1161903484803649536_3594508c327.1.4.jpg?versionId=R.ah_D.mo_IQdQwWJxYotT6bVLKG5dyc"})
  end

  def parse(_, message) do
    Chat.post_message(message.channel, "Sorry I don't understand...", %{as_user: true})
  end
end