defmodule LandingPageTest do

  use Iboard.ConnCase
  use ExUnit.Case
  use Hound.Helpers


  alias Iboard.Page

  hound_session


  @tag webdriver: true
  test "Pages index view", _meta do
    _page = Repo.insert! %Page{title: "Test Page", body: "Lorem"}

    navigate_to("/pages")

    title = find_first_title()
    assert title == "Test Page"
  end

  @tag webdriver: true
  test "Sort pages", _meta do

    # Insert two posts
    { t1, t2 } = TestHelper.two_timestamps(1000)
    Repo.insert! %Page{title: "Old Post", body: "Lorem", updated_at: t1 }
    Repo.insert! %Page{title: "New Post", body: "Lorem", updated_at: t2 }

    # Should listed in latest first order
    navigate_to("/pages")
    assert get_title_map() == ["New Post", "Old Post"]

    # Now sort to oldest first
    sort_button = find_element(:id, "sort-button")
    click(sort_button)
    assert get_title_map() == ["Old Post", "New Post"]

  end

  # Helper functions

  defp find_first_title do
    find_element(:id, "articles")
            |> find_within_element(:class, "title")
            |> find_within_element(:tag,:a)
            |> inner_html

  end
  
  defp get_title_map do
    articles = find_element(:id, "articles")

    titles   = find_all_within_element(articles, :class, "title")
   
    Enum.map(titles, fn(title) ->
      title
        |> find_within_element(:tag,:a)
        |> inner_html
    end)
  end
end
