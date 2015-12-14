defmodule Phoenixcast.VideoController do
  use Phoenixcast.Web, :controller

  plug BasicAuth, use_config: :basic_auth

  alias Phoenixcast.Video

  def index(conn, _params) do
    videos = Video.reverse_inserted_at_order |> Repo.all
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params) do
    changeset = Video.changeset(%Video{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    changeset = Video.changeset(%Video{}, video_params)
    Repo.insert(changeset) |> respond(conn, "Video created successfully.", "new.html")
  end

  def edit(conn, %{"id" => id}) do
    video = Video |> Repo.get(id)
    changeset = Video.changeset(video)
    render(conn, "edit.html", video: video, changeset: changeset)
  end

  def update(conn, %{"id" => id, "video" => video_params}) do
    video = Video |> Repo.get(id)
    changeset = Video.changeset(video, video_params)
    Repo.update(changeset) |> respond(conn, "Video update successfully.", "edit.html")
  end

  def delete(conn, %{"id" => id}) do
    video = Repo.get(Video, id)
    Repo.delete(video) |> respond(conn, "Video deleted successfully.")
  end

  defp respond(state, conn, successfully_message, error_page \\ "")

  defp respond({:ok, _video}, conn, successfully_message, _error_page) do
    conn
    |> put_flash(:info, successfully_message)
    |> redirect(to: video_path(conn, :index))
  end

  defp respond({:error, changeset}, conn, _successfully_message, error_page) do
   render(conn, error_page, changeset: changeset)
  end
end
