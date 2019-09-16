class CreateBookingRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_rooms do |t|
      t.references :users, foreign_key: true
      t.datetime :booking_date
      t.datetime :checkin_date
      t.datetime :checkout_date
      t.integer :status, default: 1
      t.string :name
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
end
