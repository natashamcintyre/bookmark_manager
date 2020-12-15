describe Bookmark do

  describe '#all' do
    let(:bookmarks) { ["http://www.makersacademy.com", "http://www.twitter.com", "http://destroyallsoftware.com"] }
    it "returns a list of all saved bookmarks" do
      expect(described_class.all).to eq bookmarks
    end
  end
end
