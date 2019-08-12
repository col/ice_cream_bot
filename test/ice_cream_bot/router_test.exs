defmodule IceCreamBot.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias IceCreamBot.Router

  test "/" do
    conn =
      conn(:get, "/")
      |> Router.call(%{})

    assert conn.status == 200
    assert conn.resp_body == "Ice Cream Meter Bot API"
  end

  test "/slack/actions" do
    conn =
      conn(:post, "/slack/action")
      |> Router.call(%{})

    assert conn.status == 200
    assert conn.resp_body == "{ \"status\": \"ok\" }"
  end
end