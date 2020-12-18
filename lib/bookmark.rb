require 'pg'

class Bookmark

  attr_reader :url, :title, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    table = conn.exec("SELECT * FROM bookmarks ORDER BY id")
    table.map { |bookmark|
      Bookmark.new(bookmark['url'], bookmark['title'], bookmark['id'])
    }
  end

  def self.create(url:, title:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(result[0]['url'], result[0]['title'], result[0]['id'])
  end

  def self.delete(url)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("DELETE FROM bookmarks WHERE url='#{url}'")
  end

  def self.update(id:, new_url:, new_title:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("UPDATE bookmarks SET url='#{new_url}', title='#{new_title}'
      WHERE id = #{id}")
  end
end
