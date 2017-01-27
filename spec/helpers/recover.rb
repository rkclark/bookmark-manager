def recover_password
  visit('/sessions/new')
  click_link('Recover Password')
  fill_in 'user_recovery_email', :with => 'test@gmail.com'
  click_button('password_recover')
end
