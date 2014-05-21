class Task < ActiveRecord::Base
	belongs_to :list

	def self.test
		@tasks = Task.all
		@tasks.each do |task|
			if (task.list != nil)
				if (task.list.user != nil and task.due != nil)
					if ((task.due-Time.now)/1.day <= 1 and (task.due - Time.now )/1.day >= 0)
								UserMailer.reminder(task.list.user,task).deliver
					end
				end
			end
		end
	end

end
