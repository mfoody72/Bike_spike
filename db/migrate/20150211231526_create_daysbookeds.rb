class CreateDaysbookeds < ActiveRecord::Migration
  def change
    create_table :daysbookeds do |t|
      t.string :booked_for

      t.timestamps null: false
    end
  end
end
