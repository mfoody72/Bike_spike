class AddBookedDateToBookedDays < ActiveRecord::Migration
  def change
  	change_table :booked_days do |t|
  		t.remove :booked_for
  		t.date :date
  		t.references :bike
  	end
  end
end
