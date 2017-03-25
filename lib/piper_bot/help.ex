defmodule PiperBot.Help do
  alias Slack.Web.Chat

  @command_blurb "The following commands are avaliable: "

  @commands_trello "

  *Trello*
  *-----------------------*
  `trello:login` *&gt;* _sends a link to you via slackbot to OAuth with PiperBot_
  `trello:me` *&gt;* _shows who you are identifed as via Trello_
  `trello:assigned` *&gt;* _grabs a list of all cards you are assigned to_
  `trello:assigned:random` *&gt;* _grabs one random card that you are assigned to_
  "
  @commands_weather "

  *Weather*
  *-----------------------*
  `weather:[:zipcode]` *&gt;* _shows the current temperature_

  "
  @commands_jokes "

  *Jokes*
  *-----------------------*
  `joke:random` *&gt;* _tells a random joke_
  "
  @commands_quotes "

  *Quotes*
  *-----------------------*
  `quote:chuck` *&gt;* _tells a random Chuck Norris quote_
  `quote:dwight` *&gt;* _tells a random Dwight Schrute quote_
  `quote:michael` *&gt;* _tells a random Michael Scott quote_
  `quote:ron` *&gt;* _tells a random Ron Swanson quote_
  "
  @commands_comics "

  *Comics*
  *-----------------------*
  `comic:xkcd` *&gt;* _shows a random comic strip from xkcd_
  `comic:xkcd:today` *&gt;* _shows todays comic strip from xkcd_
  "
  @commands_help "

  *Help*
  *-----------------------*
  `help:all` *&gt;* _lists all commands_
  `help:[:category]` *&gt;* _lists all commands of a category_
  "

  def parse("trello", message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_trello, %{as_user: true})
  end

  def parse("weather", message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_weather, %{as_user: true})
  end

  def parse("jokes", message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_jokes, %{as_user: true})
  end

  def parse("quotes", message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_quotes, %{as_user: true})
  end

  def parse("comics", message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_comics, %{as_user: true})
  end

  def parse("help", message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_help, %{as_user: true})
  end

  def parse(_, message) do
    Chat.post_message(message.channel, @command_blurb <> @commands_help <> @commands_trello <> @commands_weather <> @commands_jokes <> @commands_quotes <> @commands_comics, %{as_user: true})
  end
end