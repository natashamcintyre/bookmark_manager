feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'http://destroyallsoftware.com', title: 'Destruction')

    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "Twitter"
    expect(page).to have_content "Destruction"
  end
end
