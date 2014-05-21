class UserMailer < ActionMailer::Base

  default  :from => "info@getiddone.com"
  
  def registration_confirmation(user)
  	mail(:to=>user.email,:subject=>"Registered")
  end
end
