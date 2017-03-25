defmodule PiperBot.Router do
  use Maru.Router

  namespace :trello do
    params do
      optional :user, type: String
      optional :token, type: String
    end

    get "auth/:user/:token" do
      TrelloAuthStore.put(params[:user], params[:token])
      
      conn
      |> json(%{status: "ok", user: params[:user], token: params[:token]})
    end

    get "auth/:user" do
      conn
      |> html(File.read!("./lib/api/auth.html"))
    end 
  end
end