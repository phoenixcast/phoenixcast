defmodule Phoenixcast.VideoTest do
  use Phoenixcast.ModelCase

  alias Phoenixcast.Video

  @valid_attrs %{description: "some content", photo_url: "some content", title: "some content", video_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
