defmodule Iboard.PageView do
  use Iboard.Web, :view

  def preview(model) do
    if String.length(model.body) > 254 do
      String.slice(model.body, 0..249) <> "... "
    else
      model.body
    end
  end

end
