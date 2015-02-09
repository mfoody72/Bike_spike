class AddEndDateToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :end_date, :string
  end
end
