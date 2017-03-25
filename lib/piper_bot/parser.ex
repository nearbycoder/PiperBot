defmodule PiperBot.Parser do
  def parse_command("weather:" <> command, message) do
    PiperBot.Weather.parse(command, message)
  end

  def parse_command("game:" <> command, message) do
    PiperBot.Games.parse(command, message)
  end

  def parse_command("quote:" <> command, message) do
    PiperBot.Quotes.parse(command, message)
  end

  def parse_command("comic:" <> command, message) do
    PiperBot.Comics.parse(command, message)
  end

  def parse_command("joke:" <> command, message) do
    PiperBot.Jokes.parse(command, message)
  end

  def parse_command("trello:" <> command, message) do
    PiperBot.Trello.parse(command, message)
  end

  def parse_command("help:" <> command, message) do
    PiperBot.Help.parse(command, message)
  end

  def parse_command(_, message) do
    Slack.Web.Chat.post_message(message.channel, "Didn't understand that try `|> help:all`", %{as_user: true})
  end
end