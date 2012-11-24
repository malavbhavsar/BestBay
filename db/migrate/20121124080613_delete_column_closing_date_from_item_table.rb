class DeleteColumnClosingDateFromItemTable < ActiveRecord::Migration
  def change
    remove_column :items, :closing_date
  end
end
