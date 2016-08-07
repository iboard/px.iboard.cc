defmodule Iboard.PageAPITest do
  use Iboard.ConnCase
  alias Iboard.Page

  test "/api/pages lists all entries as json", %{conn: conn} do
    conn = get conn, "/api/pages"
    response = json_response(conn, 200)
    assert response == %{"pages" => []}
  end

  test "/api/pages/:id gets page as json", %{conn: conn} do
    page = Repo.insert! %Page{title: "Test Page", body: "Lorem" }
    conn = get conn, "/api/pages/#{page.id}"

    { title, body } = json_response(conn, 200) 
                      |> get_title_and_body_from_json

    assert( { title, body }  == { "Test Page", "Lorem" } )
  end

  # Helper functions

  defp get_title_and_body_from_json response do
    page = Map.get(response,"page")
    t = Map.get(page, "title")
    b = Map.get(page, "body")
    { t, b }
  end
    
end
