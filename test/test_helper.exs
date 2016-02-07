ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Iboard.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Iboard.Repo --quiet)


