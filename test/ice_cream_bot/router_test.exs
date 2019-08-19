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
    request = %{
      "token" => "Jhj5dZrVaK7ZwHHjRyZWjbDl",
      "challenge" => "3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P",
      "type" => "url_verification"
    }
    conn =
      conn(:post, "/slack/action", request)
      |> Router.call(%{})

    assert conn.status == 200
    assert conn.resp_body == "{\"challenge\":\"3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P\"}"
  end
end