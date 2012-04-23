ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "ec2-23-21-28-8.compute-1.amazonaws.com",  
  :user_name            => "service.projectbox",  
  :password             => "cics530project",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  