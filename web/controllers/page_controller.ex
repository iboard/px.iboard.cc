defmodule Iboard.PageController do
  use Iboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
