class CreateJoinTablePokemonAttacks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pokemons, :attacks do |t|
      t.index [:pokemon_id, :attack_id]
      t.index [:attack_id, :pokemon_id]

      t.timestamps
    end
  end
end
