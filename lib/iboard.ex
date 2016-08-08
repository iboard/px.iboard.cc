defmodule Iboard do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Iboard.Endpoint, []),
      supervisor(Iboard.Repo, []),
    ]

    opts = [strategy: :one_for_one, name: Iboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Iboard.Endpoint.config_change(changed, removed)
    :ok
  end
end
