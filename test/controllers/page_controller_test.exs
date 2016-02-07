defmodule Iboard.PageControllerTest do
  use Iboard.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to iBoard"
    assert html_response(conn, 200) =~ "/license"
    assert html_response(conn, 200) =~ "/readme"
  end

  test "GET /license", %{conn: conn} do
    conn = get conn, "/license"
    assert html_response(conn, 200) =~ "THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND"
  end

  test "GET /readme", %{conn: conn} do
    conn = get conn, "/readme"
    assert html_response(conn, 200) =~ "Install dependencies with `mix deps.get`"
  end
end
