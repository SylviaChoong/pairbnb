class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :guests
      t.date :startdate
      t.date :enddate

      t.timestamps null: false
    end
  end
end
