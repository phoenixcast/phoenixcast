defmodule Phoenixcast.PageControllerTest do
  use Phoenixcast.ConnCase
  import YoutubexParse

  setup do
    %{videos: videos} = fixtures(:videos)
    {:ok, [videos: videos]}
  end

  test "GET / return video titles", context do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ context[:videos][:video_1].title
    assert html_response(conn, 200) =~ context[:videos][:video_2].title
    assert html_response(conn, 200) =~ context[:videos][:video_3].title
  end

  test "GET / return video descriptions", context do
    conn = get conn(), "/"

    assert html_response(conn, 200) =~ context[:videos][:video_1].description
    assert html_response(conn, 200) =~ context[:videos][:video_2].description
    assert html_response(conn, 200) =~ context[:videos][:video_3].description
  end

  test "GET / return video images", context do
    conn = get conn(), "/"

    assert html_response(conn, 200) =~ YoutubexParse.Image.high_image(context[:videos][:video_1].video_url)
    assert html_response(conn, 200) =~ YoutubexParse.Image.high_image(context[:videos][:video_2].video_url)
    assert html_response(conn, 200) =~ YoutubexParse.Image.high_image(context[:videos][:video_3].video_url)
  end

  test "GET / return video url", context do
    conn = get conn(), "/"

    assert html_response(conn, 200) =~ context[:videos][:video_1].video_url
    assert html_response(conn, 200) =~ context[:videos][:video_2].video_url
    assert html_response(conn, 200) =~ context[:videos][:video_3].video_url
  end
end
