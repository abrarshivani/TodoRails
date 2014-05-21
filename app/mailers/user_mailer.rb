class UserMailer < ActionMailer::Base

  default  :from => "info@getiddone.com"
  
  def registration_confirmation(user)
  	mail(:to=>user.email,:subject=>"Registered")
  end

   def reminder(user,task)
  	mail(:to=>user.email,:subject=>"Your task" + task.title)
  end
end
