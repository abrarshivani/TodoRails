class User < ActiveRecord::Base
	has_many :lists
	validates :email, uniqueness: true

	 def self.test1
    	@users = User.all
    	@users.each do |user|
    		
    		if user.lists[0] != nil  
    			user.lists.each do |list|
    				if list.tasks[0] != nil  
    				
    					list.tasks.each do |task| 
    						if (task.due != nil)
    						if ((task.due-Time.now)/1.day <= 1 and (task.due - Time.now )/1.day >= 0)
								UserMailer.reminder(user,task).deliver
							end
							end
						
						end

    				end
    			end
    		end
  		end
	end



end
