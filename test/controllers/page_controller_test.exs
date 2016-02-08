defmodule Iboard.PageControllerTest do
  use Iboard.ConnCase

  test "GET / contains links and Welcome", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to iBoard"
    assert html_response(conn, 200) =~ "/md/license"
    assert html_response(conn, 200) =~ "/md/readme"
    assert html_response(conn, 200) =~ "/md/howto"
    assert html_response(conn, 200) =~ "/md/changelog"
  end

  test "GET /md/license contains the MIT license", %{conn: conn} do
    conn = get conn, "/md/license"
    assert html_response(conn, 200) =~ "THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND"
  end

  test "GET /md/readme renders README.md", %{conn: conn} do
    conn = get conn, "/md/readme"
    assert html_response(conn, 200) =~ "Install dependencies with `mix deps.get`"
  end

  test "GET /md/howto renders HOWTO.md", %{conn: conn} do
    conn = get conn, "/md/howto"
    assert html_response(conn, 200) =~ "What I did before the first commit"
  end

  test "GET /md/changelog renders CHANGELOG.md", %{conn: conn} do
    conn = get conn, "/md/changelog"
    assert html_response(conn, 200) =~ "Add missing test (how I could miss them?)"
  end
end
