class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :start_date
      t.string :end_date
      t.integer :bike_id

      t.timestamps null: false
    end
  end
end
