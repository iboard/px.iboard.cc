use Mix.Config

config :iboard, Iboard.Endpoint,
  http: [port: 4001],
  server: true

config :logger, level: :warn

config :iboard, Iboard.Repo,
  adapter: Mongo.Ecto,
  database: "iboard_test",
  pool_size: 1

config :hound, driver: "phantomjs", 
   host: "http://localhost", 
   port: 8910,
   app_host: "http://localhost", 
   app_port: 4001


