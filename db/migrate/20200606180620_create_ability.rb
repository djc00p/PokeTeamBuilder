class CreateAbility < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.text   :game_description
      t.text   :serebii_in_depth_description

      t.timestamps
    end
  end
end
