class Addduedateandtimetouser < ActiveRecord::Migration
  def change
  	add_column :users, :due, :timestamp
  end
end
