class AddColumnsClosingDayAndClosingTimeToItemTable < ActiveRecord::Migration
  def change
    add_column :items ,:closing_day, :date
    add_column :items ,:closing_time, :time
  end
end
