defmodule Phoenixcast.Video do
  use Phoenixcast.Web, :model
  before_insert :set_video_url
  schema "videos" do
    field :title      , :string
    field :description, :string
    field :video_url  , :string
    field :photo_url  , :string

    timestamps
  end

  @required_fields ~w(title description video_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def set_video_url(changeset) do
    changeset
    |> Ecto.Changeset.put_change(:photo_url, youtube_photo_url(changeset))
  end

  defp youtube_photo_url(changeset) do
    case fetch_youtube_data(changeset) do
      {:ok, []} ->
        ""
      {:ok, video} ->
        video["thumbnails"]["high"]["url"]
    end
  end

  defp fetch_youtube_data(changeset) do
    changeset |>
    fetch_video_url |>
    Ytx.Video.find(youtube_api_key)
  end

  defp fetch_video_url(changeset), do: Ecto.Changeset.get_field(changeset, :video_url)
  defp youtube_api_key, do: Application.get_env(:phoenixcast, :youtube_api_key)
end
