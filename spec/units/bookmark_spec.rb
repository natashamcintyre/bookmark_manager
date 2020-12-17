describe Bookmark do

  describe '#all' do
    it "returns a list of all saved bookmarks" do
      Bookmark.create(url: 'www.test.com', title: 'testtitle')
      Bookmark.create(url: 'www.test2.com', title: 'testtitle2')

      bookmarks = Bookmark.all

      expect(bookmarks.first.url).to eq 'www.test.com'
      expect(bookmarks.last.url).to eq 'www.test2.com'
    end
  end

  describe '#create' do
    it 'creates an instance of bookmark' do
      bookmark = Bookmark.create(url: 'www.test.com', title: 'testtitle')
      expect(bookmark).to be_instance_of Bookmark
    end
  end

  describe 'url' do
    it 'returns the url of the bookmark object' do
      bookmark = Bookmark.create(url: 'www.test.com', title: 'testtitle')
      expect(bookmark.url).to eq 'www.test.com'
    end
  end
end
