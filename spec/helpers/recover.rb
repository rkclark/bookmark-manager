def recover_password
  visit('/sessions/new')
  click_link('Recover Password')
  fill_in 'user_recovery_email', :with => 'test@gmail.com'
  click_button('password_recover')
end

def set_password(user_password:, password_confirmation:)
   visit("/users/reset_password?token=#{user.password_token}")
   fill_in :user_password, with: user_password
   fill_in :password_confirmation, with: password_confirmation
   click_button('reset_password')
 end
