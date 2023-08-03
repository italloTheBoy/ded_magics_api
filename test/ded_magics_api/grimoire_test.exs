defmodule DedMagicsApi.GrimoireTest do
  use DedMagicsApi.DataCase

  alias DedMagicsApi.Grimoire

  describe "magics" do
    alias DedMagicsApi.Grimoire.Magic

    import DedMagicsApi.GrimoireFixtures

    @invalid_attrs %{name: nil, level: nil, description: nil, range: nil, components: nil, book: nil, school: nil, casting_time: nil, material: nil, buff_description: nil, ritual: nil, concentration: nil}

    test "list_magics/0 returns all magics" do
      magic = magic_fixture()
      assert Grimoire.list_magics() == [magic]
    end

    test "get_magic!/1 returns the magic with given id" do
      magic = magic_fixture()
      assert Grimoire.get_magic!(magic.id) == magic
    end

    test "create_magic/1 with valid data creates a magic" do
      valid_attrs = %{name: "some name", level: 42, description: "some description", range: 120.5, components: ["option1", "option2"], book: "some book", school: "some school", casting_time: "some casting_time", material: "some material", buff_description: "some buff_description", ritual: true, concentration: true}

      assert {:ok, %Magic{} = magic} = Grimoire.create_magic(valid_attrs)
      assert magic.name == "some name"
      assert magic.level == 42
      assert magic.description == "some description"
      assert magic.range == 120.5
      assert magic.components == ["option1", "option2"]
      assert magic.book == "some book"
      assert magic.school == "some school"
      assert magic.casting_time == "some casting_time"
      assert magic.material == "some material"
      assert magic.buff_description == "some buff_description"
      assert magic.ritual == true
      assert magic.concentration == true
    end

    test "create_magic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Grimoire.create_magic(@invalid_attrs)
    end

    test "update_magic/2 with valid data updates the magic" do
      magic = magic_fixture()
      update_attrs = %{name: "some updated name", level: 43, description: "some updated description", range: 456.7, components: ["option1"], book: "some updated book", school: "some updated school", casting_time: "some updated casting_time", material: "some updated material", buff_description: "some updated buff_description", ritual: false, concentration: false}

      assert {:ok, %Magic{} = magic} = Grimoire.update_magic(magic, update_attrs)
      assert magic.name == "some updated name"
      assert magic.level == 43
      assert magic.description == "some updated description"
      assert magic.range == 456.7
      assert magic.components == ["option1"]
      assert magic.book == "some updated book"
      assert magic.school == "some updated school"
      assert magic.casting_time == "some updated casting_time"
      assert magic.material == "some updated material"
      assert magic.buff_description == "some updated buff_description"
      assert magic.ritual == false
      assert magic.concentration == false
    end

    test "update_magic/2 with invalid data returns error changeset" do
      magic = magic_fixture()
      assert {:error, %Ecto.Changeset{}} = Grimoire.update_magic(magic, @invalid_attrs)
      assert magic == Grimoire.get_magic!(magic.id)
    end

    test "delete_magic/1 deletes the magic" do
      magic = magic_fixture()
      assert {:ok, %Magic{}} = Grimoire.delete_magic(magic)
      assert_raise Ecto.NoResultsError, fn -> Grimoire.get_magic!(magic.id) end
    end

    test "change_magic/1 returns a magic changeset" do
      magic = magic_fixture()
      assert %Ecto.Changeset{} = Grimoire.change_magic(magic)
    end
  end
end
