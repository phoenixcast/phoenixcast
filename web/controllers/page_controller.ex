defmodule Phoenixcast.PageController do
  use Phoenixcast.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
