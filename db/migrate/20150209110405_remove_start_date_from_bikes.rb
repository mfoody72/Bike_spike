class RemoveStartDateFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :start_date, :string
  end
end
