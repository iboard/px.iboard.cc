use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :iboard, Iboard.Endpoint,
  secret_key_base: "mDuewhBdIhwpQIdwnwICbSRpKRUg8w/R4BcNz3cNH3AsSg/mbHU8sX20JUdoURv4"

# Configure your database
config :iboard, Iboard.Repo,
  adapter: Mongo.Ecto,
  database: "iboard_prod",
  pool_size: 20
