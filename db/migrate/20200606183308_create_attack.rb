class CreateAttack < ActiveRecord::Migration[6.0]
  def change
    create_table :attacks do |t|
      t.string :name
      t.string :type
      t.integer :pp
      t.string :attack
      t.integer :accuracy
      t.text :effect
      
      t.timestamps
    end
  end
end
