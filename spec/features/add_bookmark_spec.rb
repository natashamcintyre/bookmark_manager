feature 'add new bookmark' do
  scenario 'saves bookmark in database and displays in bookmark list' do
    PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    p "yo"
    fill_in('url', with: 'www.test.com')
    p "hi"
    click_button('Save bookmark')
    p "hello"
    expect(page).to have_content 'www.test.com'
    p "oioi"
  end
end
