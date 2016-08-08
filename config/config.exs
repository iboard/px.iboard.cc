use Mix.Config

config :iboard, Iboard.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "/o3zcurIGRvcrq7VVhDaJT/HmBp2PFdZ3jptejwWNR/3/0TBQ94XdpHXM4KBn3uL",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Iboard.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :generators,
  migration: false,
  binary_id: true

import_config "#{Mix.env}.exs"
