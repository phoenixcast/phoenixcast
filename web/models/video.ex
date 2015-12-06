defmodule Phoenixcast.Video do
  use Phoenixcast.Web, :model

  require IEx

  schema "videos" do
    field :video_url  , :string
    field :title      , :string
    field :description, :string
    field :photo_url  , :string

    timestamps
  end

  @required_fields ~w(video_url title description photo_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(put_youtube_data(params), @required_fields, @optional_fields)
  end

  def put_youtube_data(:empty), do: :empty
  def put_youtube_data(params) do
    {:ok, video} = fetch_youtube_data(params)
    do_put_youtube_data(params, video)
  end

  defp do_put_youtube_data(params, []), do: params
  defp do_put_youtube_data(params, video) do
    params
    |> Map.put("photo_url"  , youtube_photo_url(video))
    |> Map.put("title"      , youtube_title(video))
    |> Map.put("description", youtube_description(video))
  end

  defp fetch_youtube_data(params) do
    params |>
    fetch_video_url |>
    Ytx.Video.find(youtube_api_key)
  end

  defp fetch_video_url(params), do: Map.get(params, "video_url")

  defp youtube_photo_url(video)  , do: video["thumbnails"]["high"]["url"]
  defp youtube_title(video)      , do: video["title"]
  defp youtube_description(video), do: video["description"]

  defp youtube_api_key           , do: Application.get_env(:youtube, :api_key)
end
