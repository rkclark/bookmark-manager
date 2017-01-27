feature "FEATURE: Recover password" do

  before do
    sign_up
    Capybara.reset!
    allow(SendRecoverLink).to receive(:call)
  end
  let(:user) { User.first }
  scenario "can access password recovery" do
    visit('/sessions/new')
    click_link('Recover Password')
    expect(page).to have_content('Password Recovery')
  end
  scenario "can request password recovery by entering email" do
    recover_password
    expect(page).to have_content('Password recover message sent, check your inbox')
  end
  scenario "cannot use token after one hour" do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit("/users/reset_password?token=#{user.password_token}")
      expect(page).to have_content("Your token is invalid")
    end
  end
  scenario "can use token within one hour" do
    recover_password
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Please enter your new password")
  end
  scenario "can enter a new password with a valid token" do
    recover_password
    set_password(user_password: "newpassword", password_confirmation: "newpassword")
    expect(page).to have_content("Sign In")
  end
  scenario "can sign in after password reset" do
    recover_password
    set_password(user_password: "newpassword", password_confirmation: "newpassword")
    visit("/sessions/new")
    fill_in 'user_email', :with => "test@gmail.com"
    fill_in 'user_password', :with => "newpassword"
    click_button('sign_in')
    expect(page).to have_content("Welcome, test@gmail.com")
  end
  scenario "can't reset if passwords don't match" do
    recover_password
    set_password(user_password: "newpassword", password_confirmation: "wrongpassword")
    expect(page).to have_content("Password does not match")
  end
  scenario "it immediately resets token upon successful password update" do
    recover_password
    set_password(user_password: "newpassword", password_confirmation: "newpassword")
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content("Your token is invalid")
  end
  scenario "it calls the SendRecoverLink services to send the link" do
    expect(SendRecoverLink).to receive(:call).with(user)
    recover_password
  end
end
