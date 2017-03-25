defmodule Xkcd do
  use HTTPoison.Base

  def fetch_random_xkcd do
    Task.async(fn -> fetch_random() end)
    |> Task.await
  end

  defp fetch_random do
    random_number = 1..1766 |> Enum.to_list |> Enum.random
    handle_request("https://xkcd.com/#{random_number}/info.0.json")
  end

  def fetch_todays_xkcd do
    Task.async(fn -> fetch_todays() end)
    |> Task.await
  end

  defp fetch_todays() do
    handle_request("https://xkcd.com/info.0.json")
  end

  defp handle_request(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end