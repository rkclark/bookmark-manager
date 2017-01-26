feature 'FEATURE: Can filter by tags' do
  scenario 'Can see links for specific tags' do
    sign_up
    create_link("Makers Academy", "www.makersacademy.com", "Education")
    create_link("BBC", "www.bbc.co.uk", "news")
    visit('/tags/News')
    within 'ul#links' do
      expect(page).to have_content("BBC")
      expect(page).not_to have_content("Makers Academy")
    end
  end
end
