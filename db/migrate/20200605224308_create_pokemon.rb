class CreatePokemon < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :pokedex_number
      t.string :name
      t.string :type_1
      t.string :type_2
      t.string :ability_1
      t.string :ability_2
      t.string :ability_3
      t.string :ability_4
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.string :image_url
    end
  end
end
