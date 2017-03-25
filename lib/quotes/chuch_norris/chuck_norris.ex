defmodule ChuckNorris do
  use HTTPoison.Base

  def fetch_random_norris_quote do
    Task.async(fn -> fetch() end)
    |> Task.await
  end

  defp fetch do
    case HTTPoison.get("http://api.icndb.com/jokes/random") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end