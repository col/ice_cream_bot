import Config

config :logger, :console, level: System.get_env("LOG_LEVEL", "debug") |> String.to_atom()