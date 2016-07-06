defmodule Iboard.PageAPIView do
  use Iboard.Web, :view

  def render("index.json", %{pages: pages}) do
    %{pages: pages}
  end
end

