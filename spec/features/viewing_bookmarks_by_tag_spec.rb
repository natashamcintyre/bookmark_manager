feature 'viewing bookmarks by tag' do
  scenario 'displays list of tags when filtered by bookmark' do
    bookmark = Bookmark.create(url: 'http://www.filterbytagtest.com', title: 'Tag filter test')
    tag = Tag.create(content: 'tag for filter test')
    BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)

    visit('/bookmarks')
    first('.bookmark').click_link 'tag for filter test'

    expect(current_path).to eq "/tags/#{tag.id}/bookmarks"
    expect(page).to have_content 'Tag filter test'
  end
end
