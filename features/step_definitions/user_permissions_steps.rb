Given /^I am a(?:n?) (.*)$/ do |level|
  email = 'datongtest@datong.berkeley.edu'
  password = 'hunter2'
  User.create(:email => email,
           :password => password,
           :fname => 'first',
           :lname => 'last',
           :confirmed_at => Time.now).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"

  role = level.downcase.split(" ")
  User.last.update_attribute("is_#{role.join('_')}", true)
end

Given /^I am not a(?:n?) (.*)$/ do |level|
  email = 'datongtest@datong.berkeley.edu'
  password = 'hunter2'
  User.create(:email => email,
              :password => password,
              :fname => 'first',
              :lname => 'last',
              :confirmed_at => Time.now).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"

  role = level.downcase.split(" ")
  User.last.update_attribute("is_#{role.join('_')}", false)
end
