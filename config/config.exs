use Mix.Config

config :logger, :console, level: :debug

config :slack, api_token: System.get_env("BOT_TOKEN", "")