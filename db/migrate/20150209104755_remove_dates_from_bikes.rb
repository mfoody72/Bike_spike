class RemoveDatesFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :dates, :string
  end
end
