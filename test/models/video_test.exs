defmodule Phoenixcast.VideoTest do
  use Phoenixcast.ModelCase

  alias Phoenixcast.Video
  import YoutubexParse

  @valid_attrs %{description: "Description", title: "Title", video_url: "https://www.youtube.com/watch?v=g-zgxrO4kWg"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.photo_url, YoutubexParse.Image.high_image(changeset.video_url)
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
