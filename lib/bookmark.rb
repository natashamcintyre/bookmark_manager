require 'pg'

class Bookmark
  def self.all
    conn = PG.connect( dbname: 'bookmark_manager')
    table = conn.exec("SELECT * FROM bookmarks")
    table.map { |bookmark| bookmark['url'] }
  end
end
