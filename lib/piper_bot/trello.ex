defmodule PiperBot.Trello do
  alias Slack.Web.Chat
  @trello %{username: "Trello", icon_url: "https://seeklogo.com/images/T/trello-logo-CE7B690E34-seeklogo.com.png"}
  
  def parse("login", message) do
    url = TrelloService.send_auth_link(message.user)
    Chat.post_message(message.user, "Click the link to <#{url}|Authorize With Trello>", @trello)
  end

  def parse("me", message) do
    results = TrelloService.get_me(message.user)
    case results do
      {:ok, results} ->
        Chat.post_message(message.channel, "You are authorized as #{results["fullName"]}", @trello)
      {:error, error} ->
        Chat.post_message(message.channel, error, %{as_user: true})
    end
  end

  def parse("assigned", message) do
    results = TrelloService.get_assigned_cards(message.user)
    case results do
      {:ok, results} ->
        {:ok, boards} = TrelloService.get_boards(message.user)
        attachments = encode_attachments(results, boards) |> JSX.encode!
        options = Map.put_new(@trello, :attachments, attachments)
        Chat.post_message(message.channel, "", options)
      {:error, error} ->
        Chat.post_message(message.channel, error, %{as_user: true})
    end
  end

  def parse("assigned:random", message) do
    results = TrelloService.get_assigned_cards(message.user)
    case results do
      {:ok, results} ->
        {:ok, boards} = TrelloService.get_boards(message.user)
        attachments = encode_attachments(results, boards) |> Enum.take_random(1) |> JSX.encode!
        options = Map.put_new(@trello, :attachments, attachments)
        Chat.post_message(message.channel, "", options)
      {:error, error} ->
        Chat.post_message(message.channel, error, %{as_user: true})
    end
  end

  def parse(_, message) do
    Chat.post_message(message.channel, "Sorry I don't understand...", %{as_user: true})
  end

  def encode_attachments(results, boards) do
    Enum.map(results, fn attachment -> encode_attachment(attachment, boards) end)
  end

  def encode_attachment(attachment, boards) do
    IO.inspect boards
    board = Enum.find(boards, fn b -> b["id"] == attachment["idBoard"] end)
    list = Enum.find(board["lists"], fn l -> l["id"] == attachment["idList"] end)

    %{title: "<#{attachment["url"]}|#{attachment["name"]}>",
      color: "#1678BD",
      author_name: "<#{board["url"]}|#{board["name"]}> | #{list["name"]}",
      author_icon: @trello.icon_url,
      mrkdwn_in: ["pretext", "text", "fields", "author_name"],
      fields: [%{
        title: "Description",
        value: has_description(attachment["desc"]),
        short: false
      },
      %{
        title: "Labels",
        value: Enum.map(attachment["labels"], fn field -> field["name"] end) |> Enum.join(", "),
        short: false
      }]
    }
  end

  defp has_description(description) do
    if (description != ""), do: description, else: "No description listed"
  end
end