ActionMailer::Base.smtp_settings = {
  :address => "steelpuck.com",
  :authentication => :plain,
  :domain => 'steelpuck.com',
  :user_name => 'test@steelpuck.com',
  :password => 'testtest',
  :enable_starttls_auto => true
}
