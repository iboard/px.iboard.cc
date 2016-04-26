defmodule Iboard.PageController do
  use Iboard.Web, :controller

  alias Iboard.Page

  plug :scrub_params, "page" when action in [:create, :update]

  def index(conn, _params) do
    pages = Repo.all(from p in Page, order_by: [desc: p.updated_at])
    render(conn, "index.html", pages: pages)
  end

  def new(conn, _params) do
    changeset = Page.changeset(%Page{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"page" => page_params}) do
    changeset = Page.changeset(%Page{}, page_params)

    case Repo.insert(changeset) do
      {:ok, _page} ->
        conn
        |> put_flash(:info, "Page created successfully.")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    page = Repo.get!(Page, id)
    render(conn, "show.html", page: page)
  end

  def edit(conn, %{"id" => id}) do
    page = Repo.get!(Page, id)
    changeset = Page.changeset(page)
    render(conn, "edit.html", page: page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "page" => page_params}) do
    page = Repo.get!(Page, id)
    changeset = Page.changeset(page, page_params)

    case Repo.update(changeset) do
      {:ok, page} ->
        conn
        |> put_flash(:info, "Page updated successfully.")
        |> redirect(to: page_path(conn, :show, page))
      {:error, changeset} ->
        render(conn, "edit.html", page: page, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    page = Repo.get!(Page, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(page)

    conn
    |> put_flash(:info, "Page deleted successfully.")
    |> redirect(to: page_path(conn, :index))
  end

  def md(conn, %{"filename" => filename}) do
    file = String.upcase(filename)
    {:ok, text } = File.read("#{file}.md")
    render conn, "markdown.html", text: text
  end

  def md(conn, params) do
    file = String.upcase(params["filename"])
    {:ok, text } = File.read("#{file}.md")
    render conn, "markdown.html", text: text
  end

end
