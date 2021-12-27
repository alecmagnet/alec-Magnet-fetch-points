class AddTimestampToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :timestamp, :datetime
  end
end
