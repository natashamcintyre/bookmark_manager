feature 'delete bookmark' do
  scenario 'removes bookmark from the database' do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.test.com')
    fill_in('title', with: 'TestTitle')
    click_button('Save bookmark')
    click_button('TestTitle-delete')
    expect(page).not_to have_content('TestTitle')
  end
end