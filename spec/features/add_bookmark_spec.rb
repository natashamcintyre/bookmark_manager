feature 'add new bookmark' do
  scenario 'saves bookmark in database and displays in bookmark list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.test.com')
    fill_in('title', with: 'TestTitle')
    click_button('Save bookmark')
    expect(page).to have_content 'TestTitle'
  end

  scenario 'url is invalid' do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.invalidurl.com')
    fill_in('title', with: 'My invalid URL')
    click_button('Save bookmark')
    expect(page).not_to have_content('My invalid URL')
    expect(page).to have_content('You must submit a valid URL')
  end
end
