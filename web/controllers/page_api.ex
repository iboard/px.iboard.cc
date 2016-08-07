defmodule Iboard.PageAPI do
  use Iboard.Web, :controller
  alias Iboard.Repo
  alias Iboard.Page


  def index(conn, _params) do
    pages = Repo.all(Page)
    render conn, pages: pages
  end

  def show(conn, %{"id" => id}) do
    page = Repo.get!(Page, id)
    render conn, page: page
  end
end

