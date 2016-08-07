defmodule LandingPageTest do
  use Iboard.ConnCase
  use ExUnit.Case
  use Hound.Helpers

  alias Iboard.Page

  hound_session

  test "the truth", _meta do
    page = Repo.insert! %Page{title: "Test Page", body: "Lorem"}

    navigate_to("/pages")

    title = find_element(:id, "articles")
            |> find_within_element(:class, "title")
            |> find_within_element(:tag,:a)
            |> inner_html


    assert title == "Test Page"
  end

end
