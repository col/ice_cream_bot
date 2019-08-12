defmodule IceCreamBot.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get  "/" do
    send_resp(conn, 200, "Ice Cream Meter Bot API")
  end

  post "/slack/action" do
    send_resp(conn, 200, "{ \"status\": \"ok\" }")
  end

  match _ do
    send_resp(conn, 404, "Oops, not found!")
  end
end