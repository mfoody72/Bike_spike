class ChangeTableDaysbookedToDaysBooked < ActiveRecord::Migration
  def change
  	rename_table :daysbookeds, :booked_days
  end
end
