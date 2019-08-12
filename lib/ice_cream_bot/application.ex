defmodule IceCreamBot.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :https, plug: IceCreamBot.Router, options: cowboy_options},
    ]

    opts = [strategy: :one_for_one, name: IceCreamBot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp cowboy_options do
    [
      keyfile: "priv/keys/localhost.key",
      certfile: "priv/keys/localhost.cert",
      otp_app: :ice_cream_bot,
      port: 5000
    ]
  end
end
