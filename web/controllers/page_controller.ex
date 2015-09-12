defmodule Phoenixcast.PageController do
  use Phoenixcast.Web, :controller

  alias Phoenixcast.Video
  def index(conn, _params) do
    videos = Video |> Repo.all
    render conn, "index.html", videos: videos
  end
end
