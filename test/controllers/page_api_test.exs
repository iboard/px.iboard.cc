defmodule Iboard.PageAPITest do
  use Iboard.ConnCase
  alias Iboard.Page

  test "/api/pages lists all entries as json", %{conn: conn} do
    conn = get conn, "/api/pages"
    response = json_response(conn, 200)
    assert response == %{"pages" => []}
  end

end
