require 'pg'

class Bookmark

  def initialize(url)
    @url = url
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    table = conn.exec("SELECT * FROM bookmarks")
    table.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    table = conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end
