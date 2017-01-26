module SessionHelpers

  def sign_up
    visit('/')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "password"
    click_button 'sign_up'
  end

  def sign_in
    visit("/sessions/new")
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    click_button('sign_in')
  end

end
