feature 'viewing bookmarks' do
  scenario 'should present all existing bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "Bookmark_1"
    expect(page).to have_content "Bookmark_2"
  end
end
