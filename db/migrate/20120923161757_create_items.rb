class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.float :opening_bid
      t.float :highest_bid
      t.timestamps
    end
  end
end
