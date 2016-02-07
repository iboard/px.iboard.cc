defmodule Iboard.PageController do
  use Iboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def license(conn, _params) do
    { :ok, license_text } = File.read("LICENSE.md")
    render conn, "markdown.html", text: license_text
  end

  def howto(conn, _params) do
    { :ok, text } = File.read("HOWTO.md")
    render conn, "markdown.html", text: text
  end

  def readme(conn, _params) do
    { :ok, license_text } = File.read("README.md")
    render conn, "markdown.html", text: license_text
  end
end
