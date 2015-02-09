class AddStartDateToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :start_date, :string
  end
end
