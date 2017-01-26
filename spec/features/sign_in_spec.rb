feature 'FEATURE: sign in' do

  scenario "can sign in" do
    sign_up
    visit("/sessions/new")
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "password"
    click_button('sign_in')
    expect(page).to have_content "Welcome, test@gmail.com"
  end
  scenario "can see error if sign in with wrong password" do
    sign_up
    visit("/sessions/new")
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "wrongpassword"
    click_button('sign_in')
    expect(page).to have_content "The email or password is incorrect"
  end
end
