require 'bookmarktag'

describe BookmarkTag do
  describe '.create' do
    it "adds bookmark id and tag id to join table" do
      bookmark = Bookmark.create(url: 'http://www.addatag.com', title: 'Adding a tag')
      tag = Tag.create(content: "Test tag")
      bookmarktag = BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)

      persisted_data = persisted_data(table: 'bookmarktags', id: bookmarktag.id)

      expect(bookmarktag).to be_a BookmarkTag
      expect(bookmarktag.id).to eq persisted_data['id']
      expect(bookmarktag.bookmark_id).to eq bookmark.id
      expect(bookmarktag.tag_id).to eq tag.id
    end
  end
end
