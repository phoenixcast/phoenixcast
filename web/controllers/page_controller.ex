defmodule Phoenixcast.PageController do
  use Phoenixcast.Web, :controller

  alias Phoenixcast.Video

  def index(conn, _params) do
    videos = Video.reverse_inserted_at_order |> Repo.all
    render conn, "index.html", videos: videos
  end
end
