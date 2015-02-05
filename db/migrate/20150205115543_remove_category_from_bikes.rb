class RemoveCategoryFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :category, :string
  end
end
