defmodule Phoenixcast.PageControllerTest do
  use Phoenixcast.ConnCase

  setup do
    %{videos: videos} = fixtures(:videos)
    {:ok, [videos: videos]}
  end

  test "GET /", context do
    conn = get conn(), "/"
  end
end
