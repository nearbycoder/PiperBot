defmodule RonSwanson do
  use HTTPoison.Base

  def fetch_random_ron_quote do
    Task.async(fn -> fetch() end)
    |> Task.await
  end

  defp fetch do
    case HTTPoison.get("http://ron-swanson-quotes.herokuapp.com/v2/quotes") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end