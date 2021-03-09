# require 'database_helpers'
#
# describe Bookmark do
#
#   describe '#all' do
#     it "returns a list of all saved bookmarks" do
#       Bookmark.create(url: 'http://www.test.com', title: 'testtitle')
#       Bookmark.create(url: 'http://www.test2.com', title: 'testtitle2')
#
#       bookmarks = Bookmark.all
#
#       expect(bookmarks.first.url).to eq 'http://www.test.com'
#       expect(bookmarks.last.url).to eq 'http://www.test2.com'
#     end
#   end
#
#   describe '#create' do
#     it 'creates an instance of bookmark' do
#       bookmark = Bookmark.create(url: 'http://www.test.com', title: 'testtitle')
#       persisted_data = persisted_data(relevant_class: Bookmark, id: bookmark.id)
#
#       expect(bookmark).to be_a Bookmark
#       expect(bookmark.id).to eq persisted_data['id']
#       expect(bookmark.title).to eq 'testtitle'
#       expect(bookmark.url).to eq 'http://www.test.com'
#     end
#
#     it "does not create an invalid bookmark" do
#       Bookmark.create(url: 'not valid', title: 'invalid bookmark')
#       expect(Bookmark.all).to be_empty
#     end
#
#   end
#
#   describe 'url' do
#     it 'returns the url of the bookmark object' do
#       bookmark = Bookmark.create(url: 'http://www.test.com', title: 'testtitle')
#       expect(bookmark.url).to eq 'http://www.test.com'
#     end
#   end
#
#   describe '#delete' do
#     it 'deletes a bookmark from the database' do
#       bookmark = Bookmark.create(url: "http://www.deleteme.com", title: "Delete Me")
#       Bookmark.find_by(id: bookmark.id).delete
#       expect(Bookmark.all).to_not include bookmark
#     end
#   end
#
#   describe '#update' do
#     it 'updates a bookmark in the database' do
#       bookmark = Bookmark.create(url: "http://www.updateme.com", title: "Update me")
#       Bookmark.find_by(id: bookmark.id).update(url: "http://www.updated.com", title: "Updated!")
#       persisted_data = persisted_data(relevant_class: Bookmark, id: bookmark.id)
#
#       expect(persisted_data['url']).to eq "http://www.updated.com"
#       expect(persisted_data['title']).to eq "Updated!"
#     end
#   end
#
#   let(:comment_class) { double(:comment_class) }
#
#   describe '#comments' do
#     it "calls .where on the Comment class" do
#       bookmark = Bookmark.create(url: "http://www.urlneedscomment.com", title: "Add comment to me")
#       expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
#
#       bookmark.comments(comment_class)
#     end
#   end
#
#   let(:tag_class) { double(:tag_class) }
#   describe '#tags' do
#     it "calls .where on the Tag class" do
#       bookmark = Bookmark.create(url: 'http://www.testingtag.com', title: 'Testing viewing tag')
#       expect(tag_class).to receive(:where).with(bookmark_id: bookmark.id)
#
#       bookmark.tags(tag_class)
#     end
#   end
#
#   describe '.where' do
#     it 'returns a list of bookmarks for given tag' do
#       bookmark1 = Bookmark.create(url: 'http://www.testingtag.com', title: 'Bookmark1 with tag')
#       bookmark2 = Bookmark.create(url: 'http://www.testingtag2.com', title: 'Bookmark2 with tag')
#       tag = Tag.create(content: 'test tag')
#       BookmarkTag.create(bookmark_id: bookmark1.id, tag_id: tag.id)
#       BookmarkTag.create(bookmark_id: bookmark2.id, tag_id: tag.id)
#
#       bookmarks = Bookmark.where(tag_id: tag.id)
#       bookmark = bookmarks.first
#
#       expect(bookmarks.length).to be 2
#       expect(bookmark).to be_a Bookmark
#       expect(bookmark.title).to eq 'Bookmark1 with tag'
#       expect(bookmark.url).to eq bookmark.url
#     end
#   end
# end
