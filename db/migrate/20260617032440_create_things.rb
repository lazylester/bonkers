class CreateThings < ActiveRecord::Migration[8.1]
  def change
    create_table :things do |t|
      t.string :name
      t.string :color
      t.integer :grade

      t.timestamps
    end
  end
end
