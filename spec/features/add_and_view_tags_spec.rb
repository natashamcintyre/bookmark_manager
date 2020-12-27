require_relative './web_helper.rb'

feature 'tags' do
  scenario 'users can add a tag to a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.addatag.com', title: 'Adding a tag')
    visit('/bookmarks')
    first('.bookmark').click_button ('Add Tag')

    expect(current_path).to eq ("/bookmarks/#{bookmark.id}/tags/new")

    fill_in 'Tag', with: 'My New Tag'
    click_button 'Apply Tag'

    expect(current_path).to eq ("/bookmarks")
    expect(first('.bookmark')).to have_content 'My New Tag'
  end
end
