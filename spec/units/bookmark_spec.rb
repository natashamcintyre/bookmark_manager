describe Bookmark do

  describe '#all' do
    let(:bookmarks) { ["http://www.makersacademy.com", "http://www.twitter.com", "http://destroyallsoftware.com"] }
    it "returns a list of all saved bookmarks" do
      conn = PG.connect(dbname: 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://destroyallsoftware.com');")
      expect(described_class.all).to eq bookmarks
    end
  end

  describe '#create' do
    it 'creates an instance of bookmark' do 
       Bookmark.create(url: 'www.test.com')
      expect(Bookmark.all).to include 'www.test.com'
    end
  end
end
