ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "asciicasts.com",  
  :user_name            => "asciicasts",  
  :password             => "secret",  
  :authentication       => :login,  
  :enable_starttls_auto => true  
}  
