defmodule Iboard.PageControllerTest do
  use Iboard.ConnCase

  alias Iboard.Page
  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  test "GET / contains links and Welcome", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to iBoard"
    assert html_response(conn, 200) =~ "/md/license"
    assert html_response(conn, 200) =~ "/md/readme"
    assert html_response(conn, 200) =~ "/md/howto"
    assert html_response(conn, 200) =~ "/md/changelog"
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, page_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pages"
  end

  test "index has sort-links", %{conn: conn} do
    conn = get conn, page_path(conn, :index)
    assert html_response(conn, 200) =~ "Oldest first"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, page_path(conn, :new)
    assert html_response(conn, 200) =~ "New page"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, page_path(conn, :create), page: @valid_attrs
    assert redirected_to(conn) == page_path(conn, :index)
    assert Repo.get_by(Page, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, page_path(conn, :create), page: @invalid_attrs
    assert html_response(conn, 200) =~ "New page"
  end

  test "shows chosen resource", %{conn: conn} do
    page = Repo.insert! %Page{title: "Test Page"}
    conn = get conn, page_path(conn, :show, page)
    assert html_response(conn, 200) =~ "Test Page"
  end

  test "renders body.preview on index page", %{conn: conn} do
    page = Repo.insert! %Page{title: "Test Page", body: TestHelper.lorem }
    conn = get conn, "/"
    response = html_response(conn, 200) |> HtmlEntities.decode
    assert response =~ Iboard.PageView.preview(conn,page)
  end

  test "preview adds more-link to /pages/:id", %{conn: conn} do
    page = Repo.insert! %Page{title: "Test Page", body: TestHelper.lorem }
    conn = get conn, "/"
    response = html_response(conn, 200) |> HtmlEntities.decode
    assert response =~ "/pages/#{page.id}\">more"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, page_path(conn, :show, "111111111111111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = get conn, page_path(conn, :edit, page)
    assert html_response(conn, 200) =~ "Edit page"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = put conn, page_path(conn, :update, page), page: @valid_attrs
    assert redirected_to(conn) == page_path(conn, :show, page)
    assert Repo.get_by(Page, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = put conn, page_path(conn, :update, page), page: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit page"
  end

  test "deletes chosen resource", %{conn: conn} do
    page = Repo.insert! %Page{}
    conn = delete conn, page_path(conn, :delete, page)
    assert redirected_to(conn) == page_path(conn, :index)
    refute Repo.get(Page, page.id)
  end

  test "GET /md/readme renders README.md", %{conn: conn} do
    conn = get conn, "/md/readme"
    assert html_response(conn, 200) =~ "Finaly, this one is the Elixir/Phoenix lap"
  end

  test "GET /md/howto renders HOWTO.md", %{conn: conn} do
    conn = get conn, "/md/howto"
    assert html_response(conn, 200) =~ "What I did before the first commit"
  end

  test "GET /md/changelog renders CHANGELOG.md", %{conn: conn} do
    conn = get conn, "/md/changelog"
    assert html_response(conn, 200) =~ "Add missing test (how I could miss them?)"
  end

  test "GET /md/license contains the MIT license", %{conn: conn} do
    conn = get conn, "/md/license"
    assert html_response(conn, 200) =~ "THE SOFTWARE IS PROVIDED &quot;" <>
    "AS IS&quot;, WITHOUT WARRANTY " <>
    "OF ANY KIND"
  end

end
