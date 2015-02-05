class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :category
      t.string :title
      t.text :description
      t.integer :bike_id

      t.timestamps null: false
    end
  end
end
