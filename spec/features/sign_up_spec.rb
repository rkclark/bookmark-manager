feature "FEATURE: sign up" do
  scenario "sign up with email and password" do
    sign_up
    expect(page.current_path).to eq "/links"
    expect(page).to have_content "Welcome, test@gmail.com"
    expect(User.all.count).to eq 1
  end

  scenario "cannot enter wrong password in the password confirmation" do
    visit('/')
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "wrongpassword"
    click_button 'sign_up'
    expect(User.all.count).to eq 0
    expect(page.current_path).to eq "/users/new"
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "cannot leave email field blank" do
    visit('/')
    fill_in 'user_password', :with => "password"
    fill_in 'password_confirmation', :with => "password"
    click_button 'sign_up'
    expect(User.all.count).to eq 0
    expect(page).to have_content "Email must not be blank"
    end
    scenario "cannot use invalid email address" do
      visit('/')
      fill_in 'user_email', :with => "i am not an email address"
      fill_in 'user_password', :with => "password"
      fill_in 'password_confirmation', :with => "password"
      click_button 'sign_up'
      expect(User.all.count).to eq 0
      expect(page).to have_content "Email has an invalid format"
      end
end
