class Addduedateandtimetotasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :due, :timestamp
  end
end
