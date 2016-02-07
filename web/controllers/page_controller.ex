defmodule Iboard.PageController do
  use Iboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def license(conn, _params) do
    { :ok, license_text } = File.read("LICENSE.md")
    render conn, "markdown.html", text: license_text
  end

  def readme(conn, _params) do
    { :ok, license_text } = File.read("README.md")
    render conn, "markdown.html", text: license_text
  end
end
