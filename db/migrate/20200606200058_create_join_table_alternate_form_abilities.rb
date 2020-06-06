class CreateJoinTableAlternateFormAbilities < ActiveRecord::Migration[6.0]
  def change
    create_join_table :alternate_forms, :abilities do |t|
      t.index [:alternate_form_id, :ability_id], {name: :index_alternate_forms_id_and_ability_id}
      t.index [:ability_id, :alternate_form_id], {name: :index_ability_id_and_alternate_forms_id}

      t.timestamps
    end
  end
end
