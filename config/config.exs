use Mix.Config

config :logger, :console, level: :debug

config :slack, api_token: System.fetch_env!("BOT_TOKEN")