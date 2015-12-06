defmodule Phoenixcast.VideoController do
  use Phoenixcast.Web, :controller

  plug BasicAuth, use_config: :basic_auth

  alias Phoenixcast.Video

  def new(conn, _params) do
    changeset = Video.changeset(%Video{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    changeset = Video.changeset(%Video{}, video_params)

    case Repo.insert(changeset) do
      {:ok, _video} ->
        conn
        |> put_flash(:info, "Video created successfully.")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
