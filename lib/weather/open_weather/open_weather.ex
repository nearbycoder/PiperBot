defmodule OpenWeather do
  use HTTPoison.Base
  @weather_token Application.get_env(:piper_bot, PiperBot)[:weather_token]

  def fetch_weather_by_zip(zip) do
    Task.async(fn -> fetch(zip) end)
    |> Task.await
  end

  defp fetch(zip) do
    url = "http://api.openweathermap.org/data/2.5/weather?zip=#{zip},us&appid=#{@weather_token}&units=imperial"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end