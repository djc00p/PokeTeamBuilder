class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :type
      t.string :image_url
      t.string :name
      t.text :effect

      t.timestamps
    end
  end
end
