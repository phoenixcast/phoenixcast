defmodule Phoenixcast.VideoTest do
  use Phoenixcast.ModelCase

  alias Phoenixcast.Video

  @valid_attrs %{description: "Description", title: "Title", video_url: "https://www.youtube.com/watch?v=g-zgxrO4kWg"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
  end
end
