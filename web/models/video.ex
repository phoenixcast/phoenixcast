defmodule Phoenixcast.Video do
  use Phoenixcast.Web, :model

  schema "videos" do
    field :title      , :string
    field :description, :string
    field :video_url  , :string
    field :photo_url  , :string

    timestamps
  end

  @required_fields ~w(title description video_url photo_url)
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
end
