class CreateDetailBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_bookings do |t|
      t.references :booking_rooms, foreign_key: true
      t.references :rooms, foreign_key: true
      t.integer :current_price

      t.timestamps
    end
  end
end
