class AddPokemonRefToAlternateForms < ActiveRecord::Migration[6.0]
  def change
    add_reference :alternate_forms, :pokemon, null: false, foreign_key: true
  end
end
