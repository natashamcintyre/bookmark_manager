feature '#bookmarks' do
  let(:bookmarks) { ['Bookmark_1', 'Bookmark_2'] }
  scenario 'should present all existing bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content(bookmarks)
  end
end
