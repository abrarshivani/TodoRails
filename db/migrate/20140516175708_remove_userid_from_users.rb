class RemoveUseridFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :user_id, :integer
  end
end
