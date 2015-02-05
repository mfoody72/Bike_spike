class AddCategoryIdToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :category_id, :integer
  end
end
