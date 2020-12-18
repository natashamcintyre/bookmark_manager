def add_a_bookmark
  visit('/bookmarks/new')
  fill_in('url', with: 'www.test.com')
  fill_in('title', with: 'TestTitle')
  click_button('Save bookmark')
end
