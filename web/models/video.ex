defmodule Phoenixcast.Video do
  use Phoenixcast.Web, :model

  import Ecto.Query

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

  @doc """
    return videos from inserted order
  """
  def reverse_inserted_at_order(query \\ __MODULE__), do: from(v in query, order_by: [desc: v.inserted_at])

  defp put_youtube_data(:empty), do: :empty
  defp put_youtube_data(params), do: put_youtube_data(params, fetch_youtube_data(params))

  defp put_youtube_data(params, {:ok, []}), do: params
  defp put_youtube_data(params, {:ok, video}) do
    params
    |> Map.put("video_url"  , youtube_url(params))
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

  defp youtube_url(params), do: "https://www.youtube.com/watch?v=" <> Ytx.get_id(fetch_video_url(params))

  defp youtube_api_key           , do: Application.get_env(:ytx, :api_key)
end
