defmodule PiperBot.Brain do
  alias Slack.Web.Chat

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_event(message = %{type: "message", text: "|&gt;" <> tail}, _, state) do
    run_command String.split(tail, "|&gt;", parts: 2), message, state
  end
  def handle_event(message  = %{type: "message", text: text}, _, state) do
    text = String.downcase(text)
    cond do
      String.contains?(text, "yeppers") ->
        phrase = MichaelScott.fetch_random_michael_quote
        Chat.post_message(message.channel, phrase, %{username: "Michael Scott", icon_url: "https://v.cdn.vine.co/r/avatars/D6AAB5F2CA1161903484803649536_3594508c327.1.4.jpg?versionId=R.ah_D.mo_IQdQwWJxYotT6bVLKG5dyc"})
      true ->
        nil
    end
    {:ok, state}
  end
  def handle_event(_, _, state), do: {:ok, state}

  def handle_close(_reason, _slack, _state), do: :close

  def run_command([command, tail], message, state) do
    command
    |> String.strip
    |> PiperBot.Parser.parse_command(message)

    run_command String.split(tail, "|&gt;", parts: 2), message, state
  end

  def run_command([""], _message, state) do
    {:ok, state}
  end

  def run_command([command], message, state) do
    command
    |> String.strip
    |> PiperBot.Parser.parse_command(message)

    {:ok, state}
  end
end