class AddColumnToAttack < ActiveRecord::Migration[6.0]
  def change
    add_column :attacks, :attack_type, :string
    add_column :attacks, :type_img, :string
  end
end
