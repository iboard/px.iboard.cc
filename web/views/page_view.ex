defmodule Iboard.PageView do
  use Iboard.Web, :view

  def preview(conn,model) do
    if String.length(model.body) > 254 do
      String.slice(model.body, 0..249) <> "... " <> more_link(conn,model)
    else
      model.body
    end
  end

  def chevron_up label do
    {:safe,["<span title='Now displaying oldest first. Click to change' class='glyphicon glyphicon-chevron-up'>","</span>"]}
  end

  def chevron_down label do
    {:safe,["<span title='Now displaying latest first. Click to change' class='glyphicon glyphicon-chevron-down'>","</span>"]}
  end

  defp more_link(conn,model) do
    {:safe, parts} = link 'more', to: page_path(conn,:show, model)
    parts |> Enum.join
  end

end
