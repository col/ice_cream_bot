defmodule IceCreamBot.SlackEventHandler do

  def handle(%{"type" => "url_verification"} = params) do
    {:ok, %{challenge: Map.get(params, "challenge")}}
  end

  def handle(%{"event" => event} = params) do
    handle_event(event)
  end

  def handle(_action) do
    {:error, %{error: "unknown type"}}
  end

  def handle_event(%{"type" => "app_mention", "channel" => channel} = event) do
    Slack.Web.Chat.post_message(channel, "Are you talkin' to me?")
    {:ok, %{}}
  end

  def handle_event(_event) do
    {:error, %{error: "unknown event"}}
  end
end