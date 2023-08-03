defmodule DedMagicsApi.Repo.Migrations.MagicTable do
  use Ecto.Migration

  def change do
    create table(:magics) do
      add(:name, :varchar, null: false)
      add(:book, :varchar, null: false)
      add(:school, :varchar, null: false)
      add(:casting_time, :varchar, null: false)
      add(:material, :text)
      add(:buff_description, :text)
      add(:description, :text, null: false)
      add(:level, :integer, null: false)
      add(:range, :float, null: false, comment: "In meters")
      add(:components, {:array, :text}, null: false)
      add(:ritual, :boolean, default: false)
      add(:concentration, :boolean, default: false)
    end

    create unique_index(:magics, :name)
    create index(:magics, :book)
    create index(:magics, :school)
    create index(:magics, :casting_time)
    create index(:magics, :material)
    create index(:magics, :buff_description)
    create index(:magics, :description)
    create index(:magics, :level)
    create index(:magics, :range)
    create index(:magics, :components)
    create index(:magics, :ritual)
    create index(:magics, :concentration)

    create(
      constraint(
        :magics,
        :ckeck_level,
        check: "level >= 0 AND level <= 9"
      )
    )

    create(
      constraint(
        :magics,
        :check_components,
        check: "
        ARRAY_LENGTH(components, 1) >= 1
        and ARRAY_LENGTH(components, 1) <= 3
        and components <@ ARRAY['M', 'V', 'S']
      "
      )
    )

    create(
      constraint(
        :magics,
        :check_school,
        check: "school IN (
        'abjuration',
        'alteration',
        'conjuration',
        'divination',
        'enchantment',
        'illusion',
        'invocation',
        'necromancy'
      )"
      )
    )
  end
end
