defmodule Phoenixcast.Video do
  use Phoenixcast.Web, :model

  import YoutubexParse.Image

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
    |> Ecto.Changeset.put_change(:photo_url, YoutubexParse.Image.high_image(Ecto.Changeset.get_field(changeset, :video_url)))
  end
end
