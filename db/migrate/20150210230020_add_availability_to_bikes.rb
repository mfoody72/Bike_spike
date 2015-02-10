class AddAvailabilityToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :availability, :string
  end
end
