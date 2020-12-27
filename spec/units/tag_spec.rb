require 'tag'
require 'database_helpers'

describe Tag do
  describe '.create' do
    it "creates a new tag" do
      bookmark = Bookmark.create(url: 'http://www.tagtest.com', title: 'Tag Test Bookmark')
      tag = Tag.create(content: 'test tag')

      persisted_tag_data = persisted_data(table: 'tags', id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_tag_data['id']
      expect(tag.content).to eq 'test tag'
    end
  end

  describe '.where' do
    it 'returns a list of tags for given bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testingtag.com', title: 'Testing viewing tag')
      tag1 = Tag.create(content: 'test tag 1')
      tag2 = Tag.create(content: 'test tag 2')
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag2.id)

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first

      expect(tags.length).to be 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end

  describe '.all' do
    it 'returns list of all tags' do
      tag1 = Tag.create(content: 'tag 1 .all test')
      tag2 = Tag.create(content: 'tag 2 .all test')

      expect(Tag.all.first.id).to eq tag1.id
      expect(Tag.all.first.content).to eq tag1.content
    end
  end

  let(:bookmark_class) { double(:bookmark_class) }
  describe '.bookmarks' do
    it 'calls .where on the Bookmark class' do
      tag = Tag.create(content: 'test tag')

      expect(bookmark_class).to receive(:where).with(tag_id: tag.id)

      tag.bookmarks(bookmark_class)
    end
  end

  describe '.find' do
    it "returns the tag id for the given content" do
      tag = Tag.create(content: 'Testing .find')
      result = Tag.find(id: tag.id)

      expect(result.id).to eq tag.id
      expect(result.content).to eq tag.content
    end
  end
end
