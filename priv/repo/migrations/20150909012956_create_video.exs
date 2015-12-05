defmodule Phoenixcast.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :description, :text
      add :video_url, :string
      add :photo_url, :string

      timestamps
    end

  end
end
