defmodule TrelloService do
  use HTTPoison.Base
  @trello_key Application.get_env(:piper_bot, PiperBot)[:trello_key]
  @origin "http://127.0.0.1:8880/trello/auth"

  def send_auth_link(user) do
    "https://trello.com/1/authorize?return_url=#{@origin}/#{user}?&callback_method=fragment&expiration=never&name=PiperBot&key=#{@trello_key}"
  end

  def get_me(user) do
    case TrelloAuthStore.get(user) do
      nil ->
        {:error, "Please authorize with `|> trello:login`"}
      token ->
        params = {:params, [{"key", @trello_key}, {"token", token}]}
        case HTTPoison.get("https://api.trello.com/1/member/me/", [], [params]) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            body
            |> Poison.decode
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:error, reason}
        end
    end
  end

  def get_assigned_cards(user) do
    case TrelloAuthStore.get(user) do
      nil ->
        {:error, "Please authorize with `|> trello:login`"}
      token ->
        params = {:params, [{"key", @trello_key}, {"token", token}]}
        case HTTPoison.get("https://api.trello.com/1/member/me/cards", [], [params]) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            body
            |> Poison.decode
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:error, reason}
        end
    end
  end

  def get_boards(user) do
    case TrelloAuthStore.get(user) do
      nil ->
        {:error, "Please authorize with `|> trello:login`"}
      token ->
        params = {:params, [{"key", @trello_key}, {"token", token}, {"lists", "all"}]}
        case HTTPoison.get("https://api.trello.com/1/member/me/boards", [], [params]) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            body
            |> Poison.decode
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:error, reason}
        end
    end
  end
end