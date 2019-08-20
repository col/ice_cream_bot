defmodule IceCreamBot.SlackEventHandler do

  def handle(%{"type" => "url_verification"} = params) do
    {:ok, %{challenge: Map.get(params, "challenge")}}
  end

  def handle(%{"type" => "app_mention", "channel" => channel} = params) do
    Slack.Web.Chat.post_message(channel, "Are you talkin' to me?")

    {:ok, %{}}
  end

  def handle(_) do
    {:error, %{error: "unknown type"}}
  end
end