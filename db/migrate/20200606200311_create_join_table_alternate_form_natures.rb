class CreateJoinTableAlternateFormNatures < ActiveRecord::Migration[6.0]
  def change
    create_join_table :alternate_forms, :natures do |t|
      t.index [:alternate_form_id, :nature_id], {name: :index_alternate_forms_id_and_nature_id}
      t.index [:nature_id, :alternate_form_id], {name: :index_nature_id_and_alternate_forms_id}

      t.timestamps
    end
  end
end
