defmodule IceCreamBot.SlackEventHandler do

  def handle(%{"type" => "url_verification"} = params) do
    {:ok, %{challenge: Map.get(params, "challenge")}}
  end

  def handle(_) do
    {:error, "unknown type"}
  end
end