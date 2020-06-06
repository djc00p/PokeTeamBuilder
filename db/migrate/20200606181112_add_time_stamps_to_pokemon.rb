class AddTimeStampsToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_timestamps(:pokemons, null: false)
  end
end
