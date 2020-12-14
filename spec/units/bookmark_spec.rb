describe Bookmark do

  describe '#all' do
    let(:bookmarks) { ['Bookmark_1', 'Bookmark_2'] }
    it "returns a list of all saved bookmarks" do
      expect(described_class.all).to eq bookmarks
    end
  end

end
