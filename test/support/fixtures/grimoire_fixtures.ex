defmodule DedMagicsApi.GrimoireFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DedMagicsApi.Grimoire` context.
  """

  @doc """
  Generate a magic.
  """
  def magic_fixture(attrs \\ %{}) do
    {:ok, magic} =
      attrs
      |> Enum.into(%{
        name: "some name",
        level: 42,
        description: "some description",
        range: 120.5,
        components: ["option1", "option2"],
        book: "some book",
        school: "some school",
        casting_time: "some casting_time",
        material: "some material",
        buff_description: "some buff_description",
        ritual: true,
        concentration: true
      })
      |> DedMagicsApi.Grimoire.create_magic()

    magic
  end
end
