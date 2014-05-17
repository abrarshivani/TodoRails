class List < ActiveRecord::Base
	has_many :tasks, :dependent => :delete_all
	belongs_to :user
end
