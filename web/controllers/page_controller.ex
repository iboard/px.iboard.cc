defmodule Iboard.PageController do
  use Iboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def md(conn, params) do
    file = String.upcase(params["filename"])
    {:ok, text } = File.read("#{file}.md")
    render conn, "markdown.html", text: text
  end

end
