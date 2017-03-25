defmodule PiperBot.Weather do
  alias Slack.Web.Chat

  def parse(nil, message) do
    Chat.post_message(message.channel, "Sorry I don't understand...", %{as_user: true})
  end

  def parse(command, message)  when is_integer(command)  do
    weather = OpenWeather.fetch_weather_by_zip(command)

    case weather do
      {:ok, %{"main" => main, "name" => name, "weather" => weather}} ->
        weather_info = Enum.at(weather, 0)
        temp = main["temp"]
        description = weather_info["description"]
        icon = weather_info["icon"]
        weather_string = Float.to_string(temp) <> "°F " <> name

        Chat.post_message(message.channel,
                          weather_string,
                          %{username: "Weather  (#{description})",
                            icon_url: "http://openweathermap.org/img/w/#{icon}.png"
                           })
      {:error, _} ->
        Chat.post_message(message.channel,
                          "Service is unavaliable try again later.",
                          %{as_user: true})
    end
  end

  def parse(command, message) do
    cond do
      String.match?(command, ~r/^[0-9]{5,5}$/) ->
        parse(String.to_integer(command), message)
      true -> 
        parse(nil, message)
    end
  end
end