defmodule Phoenixcast.VideoController do
  use Phoenixcast.Web, :controller

  alias Phoenixcast.Video

  plug :scrub_params, "video" when action in [:create, :update]

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render(conn, "show.html", video: video)
  end
end
