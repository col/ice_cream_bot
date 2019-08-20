defmodule IceCreamBot.Bot do
  use Slack
  require Logger

  def handle_connect(_slack, state) do
    Logger.info("handle_connect - state: #{inspect(state)}")
    {:ok, state}
  end

  def handle_close(reason, _slack, state) do
    Logger.info("handle_connect - reason: #{inspect(reason)} state: #{inspect(state)}")
    {:ok, state}
  end

  def handle_event(message = %{type: "message"}, slack, state) do
    Logger.info("handle_event - message: #{inspect(message)}, state: #{inspect(state)}")

    if message.text == "Hi" do
      send_message("Hello to you too!", message.channel, slack)
    end

    {:ok, state}
  end

  def handle_event(message, _slack, state) do
    Logger.info("handle_event - message: #{inspect(message)}, state: #{inspect(state)}")
    {:ok, state}
  end

  def handle_info(message, _slack, state) do
    Logger.info("handle_info - message: #{inspect(message)}, state: #{inspect(state)}")
    {:ok, state}
  end
end