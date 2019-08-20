import Config

config :logger, :console, level: System.get_env("LOG_LEVEL", "debug") |> String.to_atom()

config :slack, api_token: System.fetch_env!("BOT_TOKEN")