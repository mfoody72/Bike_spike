class RemoveBikeIdFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :bike_id, :integer
  end
end
