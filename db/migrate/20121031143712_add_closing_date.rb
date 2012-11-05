class AddClosingDate < ActiveRecord::Migration
  def up
    add_column :items, :closing_date, :datetime
  end

  def down
  end
end
