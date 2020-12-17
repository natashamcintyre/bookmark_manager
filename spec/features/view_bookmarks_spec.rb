feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'http://destroyallsoftware.com', title: 'Destruction')

    visit('/bookmarks')

    expect(page).to have_link 'Makers', href: 'http://www.makersacademy.com'
    expect(page).to have_link 'Twitter', href: 'http://www.twitter.com'
    expect(page).to have_link 'Destruction', href: 'http://destroyallsoftware.com'
  end
end
