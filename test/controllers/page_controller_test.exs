defmodule Phoenixcast.PageControllerTest do
  use Phoenixcast.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix Cast!"
  end
end
