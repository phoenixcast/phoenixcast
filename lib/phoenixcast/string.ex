defmodule Phoenixcast.String do
  @type t :: binary

  @spec truncate(t, non_neg_integer) :: t
  @spec truncate(t, non_neg_integer, char) :: t
  def truncate(string, truncate_at, omission \\ "...") do
    do_truncate(string, truncate_at, omission, String.length(string))
  end

  defp do_truncate(string, truncate_at, _omission, string_lenght) when truncate_at > string_lenght do
    string
  end
  defp do_truncate(string, truncate_at, omission, _string_lenght) do
    "#{String.slice(string, 0..truncate_at)}#{omission}"
  end
end
