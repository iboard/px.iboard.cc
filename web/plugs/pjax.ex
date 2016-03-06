defmodule Pjax.Plugs.Pjax do
  import Plug.Conn
  use Phoenix.Controller

  def init(default), do: default

  def call(conn, default) do
    use_pjax? = Enum.any?(conn.req_headers, fn(x) -> {"x-pjax", "true"} == x end)
    IO.puts "USING PJAX: #{use_pjax?}"
    if use_pjax?, do: conn |> put_layout(false), else: conn
  end
end
