feature 'add new bookmark' do
  scenario 'saves bookmark in database and displays in bookmark list' do
    PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in('url', with: 'www.test.com')
    click_button('Save bookmark')
    expect(page).to have_content 'www.test.com'
  end
end
