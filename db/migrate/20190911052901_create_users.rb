class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :password_digest
      t.string :remember_digest
      t.integer :role, default: 0
      t.string :activation_digest
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
