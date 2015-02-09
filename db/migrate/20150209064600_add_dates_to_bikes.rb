class AddDatesToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :dates, :string
  end
end
