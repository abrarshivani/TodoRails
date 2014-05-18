class User < ActiveRecord::Base
	has_many :lists
	validates :email, uniqueness: true
end
