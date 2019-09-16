class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :users, foreign_key: true
      t.references :rooms, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
