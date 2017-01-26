module LinkHelpers

  def create_link(title, url, *tags)
    click_button('add_new_link')
    fill_in 'link_title', :with => title
    fill_in 'link_url', :with => url
    fill_in 'link_tags', :with => [*tags].join(",")
    click_button('submit_link')
  end

end
