class CreateNature < ActiveRecord::Migration[6.0]
  def change
    create_table :natures do |t|
      t.string :nature
      t.string :increases
      t.string :decreases

      t.timestamps
    end
  end
end
