class List < ActiveRecord::Base
	has_many :tasks, :dependent => :delete_all
end
