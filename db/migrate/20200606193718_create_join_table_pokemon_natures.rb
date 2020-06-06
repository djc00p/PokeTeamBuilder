class CreateJoinTablePokemonNatures < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pokemons, :natures do |t|
      t.index [:pokemon_id, :nature_id]
      t.index [:nature_id, :pokemon_id]

      t.timestamps
    end
  end
end
