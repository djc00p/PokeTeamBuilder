class CreateJoinTableAlternateFormAttacks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :alternate_forms, :attacks do |t|
      t.index [:alternate_form_id, :attack_id], { name: :index_alternate_forms_id_and_attack_id }
      t.index [:attack_id, :alternate_form_id], { name: :index_attack_id_and_alternate_forms_id }

      t.timestamps
    end
  end
end
