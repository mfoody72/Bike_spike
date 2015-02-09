class RemoveEndDateFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :end_date, :string
  end
end
