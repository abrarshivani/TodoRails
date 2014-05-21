class Removeduedateandtimetouser < ActiveRecord::Migration
  def change
  	remove_column :users, :due, :timestamp
  end
end
