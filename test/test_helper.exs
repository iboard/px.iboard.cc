Application.ensure_all_started(:hound)
ExUnit.start()

Mix.Task.run "ecto.create", ~w(-r Iboard.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Iboard.Repo --quiet)

defmodule TestHelper do

  def two_timestamps interval do
    {:ok, d1 } = DateTime.from_unix(1000)
    {:ok, d2 } = DateTime.from_unix(1000+interval)
    {:ok, t1 } = d1 |> Ecto.DateTime.cast 
    {:ok, t2 } = d2 |> Ecto.DateTime.cast 
    { t1, t2 }
  end

  def lorem do
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  end

end



