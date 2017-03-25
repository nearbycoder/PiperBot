defmodule PiperBot.API do
    use Maru.Router

    mount PiperBot.Router

    rescue_from :all do
      conn
      |> put_status(404)
      |> text("Not Found")
    end
  end