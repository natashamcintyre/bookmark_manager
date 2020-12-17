feature 'add new bookmark' do
  scenario 'saves bookmark in database and displays in bookmark list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.test.com')
    fill_in('title', with: 'TestTitle')
    click_button('Save bookmark')
    expect(page).to have_content 'TestTitle'
  end
end
