use Mix.Config

config :iboard, Iboard.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: 4000],
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

config :iboard, Iboard.Repo,
  adapter: Mongo.Ecto,
  database: "iboard_prod",
  pool_size: 10,
  hostname: "mongo",
  port: 27117

import_config "prod.secret.exs"
