defmodule IceCreamBot.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: IceCreamBot.Router, options: [port: 8080]},
    ]

    opts = [strategy: :one_for_one, name: IceCreamBot.Supervisor]
    Supervisor.start_link(children, opts)

    Slack.Bot.start_link(IceCreamBot.Bot, [], System.get_env("BOT_TOKEN"))
  end
end
