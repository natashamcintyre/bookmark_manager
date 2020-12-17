feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.twitter.com')
    Bookmark.create(url: 'http://destroyallsoftware.com')

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://destroyallsoftware.com"
  end
end
