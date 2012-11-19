class AddClosingDate < ActiveRecord::Migration
  def change
    add_column :items, :closing_date, :datetime
  end
end
