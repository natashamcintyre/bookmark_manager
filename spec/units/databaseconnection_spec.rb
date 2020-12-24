require 'databaseconnection'

describe DatabaseConnection do
  describe 'self.setup' do
    it "connects to database through PG" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'establishes a persistent connection' do
      conn = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq conn
    end
  end

  describe 'self.query' do
    it "passes sql string to database" do
      conn = DatabaseConnection.setup('bookmark_manager_test')
      expect(conn).to receive(:exec).with('SELECT * FROM bookmarks')
      DatabaseConnection.query('SELECT * FROM bookmarks')
    end
  end

end
