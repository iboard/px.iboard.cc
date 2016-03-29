defmodule Iboard.MarkdownView do
  use Iboard.Web, :view


  @doc """
  Return current time as a string
  """
  def current_time do
    {{y,m,d}, {h,min,sec}} =  :calendar.local_time()
    :io_lib.format( "~w/~w/~w ~2..0B:~2..0B.~2..0B", [m,d,y,h,min,sec])
  end
end
