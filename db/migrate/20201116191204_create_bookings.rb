class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :accepted

      t.timestamps
    end
  end
end
