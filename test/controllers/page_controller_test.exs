defmodule Iboard.PageControllerTest do
  use Iboard.ConnCase

  test "GET / contains links and Welcome", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to iBoard"
    assert html_response(conn, 200) =~ "/license"
    assert html_response(conn, 200) =~ "/readme"
    assert html_response(conn, 200) =~ "/howto"
    assert html_response(conn, 200) =~ "/changelog"
  end

  test "GET /license contains the MIT license", %{conn: conn} do
    conn = get conn, "/license"
    assert html_response(conn, 200) =~ "THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND"
  end

  test "GET /readme renders README.md", %{conn: conn} do
    conn = get conn, "/readme"
    assert html_response(conn, 200) =~ "Install dependencies with `mix deps.get`"
  end

  test "GET /howto renders HOWTO.md", %{conn: conn} do
    conn = get conn, "/howto"
    assert html_response(conn, 200) =~ "What I did before the first commit"
  end

  test "GET /changelog renders CHANGELOG.md", %{conn: conn} do
    conn = get conn, "/changelog"
    assert html_response(conn, 200) =~ "Add missing test (how I could miss them?)"
  end
end
