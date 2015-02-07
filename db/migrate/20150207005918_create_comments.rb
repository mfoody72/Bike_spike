class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :bike, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :bikes
    add_foreign_key :comments, :users
  end
end
