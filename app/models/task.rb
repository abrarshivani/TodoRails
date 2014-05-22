class Task < ActiveRecord::Base
	belongs_to :list

	def self.test
		@tasks = Task.all
		@tasks.each do |task|
			if (task.completed== false and task.list != nil)
				if (task.list.user != nil and task.due != nil)
					if ( (DateTime.parse(task.due.strftime("%c")) - DateTime.parse(Time.now.strftime("%c"))) <= 1 and (DateTime.parse(task.due.strftime("%c")) - DateTime.parse(Time.now.strftime("%c"))) >= 0)
								UserMailer.reminder(task.list.user,task).deliver
					end
				end
			end
		end
	end

end
