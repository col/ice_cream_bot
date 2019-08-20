defmodule IceCreamBot.Router do
  require Logger
  use Plug.Router
  alias IceCreamBot.SlackEventHandler

  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Jason
  plug :dispatch

  get  "/" do
    send_resp(conn, 200, "Ice Cream Meter Bot API")
  end

  post "/slack/action" do
    Logger.debug "Received Action: #{inspect(conn.body_params)}"
    response = SlackEventHandler.handle(conn.body_params)
    render(conn, response)
  end

  match _ do
    send_resp(conn, 404, "Oops, not found!")
  end

  defp render(conn, {:ok, response}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(response))
  end

  defp render(conn, {:error, response}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(422, Jason.encode!(response))
  end
end