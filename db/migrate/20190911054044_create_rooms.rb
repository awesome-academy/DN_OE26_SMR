class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.text :detail
      t.float :price
      t.integer :status, default: 1
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
