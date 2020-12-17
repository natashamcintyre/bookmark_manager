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
    table.map { |bookmark| bookmark['url'] + bookmark['title'] }
  end

  def self.create(url:, title:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    table = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end
end
