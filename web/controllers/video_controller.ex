defmodule Phoenixcast.VideoController do
  use Phoenixcast.Web, :controller

  alias Phoenixcast.Video

  def index(conn, _params) do
    videos = Video.reverse_inserted_at_order |> Repo.all
    render conn, "index.html", videos: videos
  end

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render(conn, "show.html", video: video)
  end
end
