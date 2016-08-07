defmodule Iboard.PageAPIView do
  use Iboard.Web, :view

  def render("index.json", %{pages: pages}) do
    %{pages: pages}
  end

  def render("show.json", %{page: page}) do
    %{page: page}
  end
end

