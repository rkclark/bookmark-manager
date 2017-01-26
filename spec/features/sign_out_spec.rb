feature "FEATURE: sign out" do

  scenario "can sign out" do
    sign_up
    sign_in
    click_button('sign_out')
    expect(page).to have_content("Goodbye")
  end
end
