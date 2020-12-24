feature 'adding and viewing comments' do
  feature 'a user can add then view a comment' do
    scenario 'a comment is added to bookmark' do
      bookmark = Bookmark.create(url: 'http://www.addacomment.com', title: 'Add Comment Here')

      visit('/bookmarks')
      first('.bookmark').click_button ('Add Comment')

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'comment', with: 'Test comment'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'Test comment'
    end
  end

end
