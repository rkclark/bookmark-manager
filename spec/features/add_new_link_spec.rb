feature "FEATURE: add new link" do
  scenario "can access new link page" do
    sign_up
    click_button('add_new_link')
    within 'form#new_link_form' do
      expect(page).to have_selector('button#submit_link')
    end
  end

  scenario "can add new link" do
    sign_up
    create_link("Makers Academy", "www.makersacademy.com", 'Education')
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario "can add new link with a tag" do
    sign_up
    create_link("Makers Academy", "www.makersacademy.com", 'Education')
    within 'ul#links' do
      expect(page).to have_content('Tags: Education')
    end
  end

  scenario "can add new link with multiple tags" do
    sign_up
    create_link("Makers Academy", "www.makersacademy.com", 'Education', 'Coding', 'Pizza')
    expect(Link.last.tags.count).to eq 3
  end

end
