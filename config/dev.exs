use Mix.Config

config :meli_api_client,
  app_id: System.get_env("MELI_APP_ID"),
  app_secret: System.get_env("MELI_APP_SECRET")
