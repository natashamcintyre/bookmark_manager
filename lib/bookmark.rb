require 'pg'
require_relative './databaseconnection.rb'
require_relative './comment.rb'

class Bookmark

  attr_reader :url, :title, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks ORDER BY id")
    result.map do |bookmark|
      Bookmark.new(
        bookmark['url'],
        bookmark['title'],
        bookmark['id']
      )
    end
  end

  def self.create(url:, title:)
    return false unless Bookmark.is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(
      result[0]['url'],
      result[0]['title'],
      result[0]['id']
    )
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.update(id:, new_url:, new_title:)
  DatabaseConnection.query(
    "UPDATE bookmarks SET url='#{new_url}', title='#{new_title}'
      WHERE id = #{id}")
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: @id)
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
