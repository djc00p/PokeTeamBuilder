class CreateJoinTablePokemonAbilities < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pokemons, :abilities do |t|
      t.index [:pokemon_id, :ability_id]
      t.index [:ability_id, :pokemon_id]

      t.timestamps
    end
  end
end
