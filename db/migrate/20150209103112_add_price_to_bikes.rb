class AddPriceToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :price, :string
  end
end
