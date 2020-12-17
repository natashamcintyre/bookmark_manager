describe Bookmark do

  describe '#all' do
    it "returns a list of all saved bookmarks" do
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.twitter.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end

  describe '#create' do
    it 'creates an instance of bookmark' do
      Bookmark.create(url: 'www.test.com')
      expect(Bookmark.all).to include 'www.test.com'
    end
  end
end
