def sign_up
  visit('/')
  fill_in 'user_email', :with => "test@gmail.com"
  fill_in 'user_password', :with => "password"
  fill_in 'password_confirmation', :with => "password"
  click_button 'sign_up'
end

def create_link(title, url, *tags)
  sign_up
  click_button('add_new_link')
  fill_in 'link_title', :with => title
  fill_in 'link_url', :with => url
  fill_in 'link_tags', :with => [*tags].join(",")
  click_button('submit_link')
end
