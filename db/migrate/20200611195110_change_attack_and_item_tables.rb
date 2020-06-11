class ChangeAttackAndItemTables < ActiveRecord::Migration[6.0]
  def change
    change_table :attacks do |t|
      t.rename :type, :move_type
      t.rename :type_img, :move_type_img
    end
    change_table :items do |t|
      t.rename :type, :item_type
    end
  end
end
