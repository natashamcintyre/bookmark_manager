class Tag

  def self.create(content:)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE content = '#{content}';").first
    if !result
      result = DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{content}') RETURNING id, content;").first
    end
    tag = Tag.new(
      id: result['id'],
      content: result['content'],
    )
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT tag_id, content FROM bookmarktags INNER JOIN tags ON tags.id = bookmarktags.tag_id WHERE bookmarktags.bookmark_id = #{bookmark_id};")
    result.map do |tag|
      Tag.new(id: tag['tag_id'], content: tag['content'])
    end
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM tags")
    result.map do |tag|
      Tag.new(id: tag['id'], content: tag['content'])
    end
  end

  def bookmarks(bookmark_class = Bookmark)
    bookmark_class.where(tag_id: @id)
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE id='#{id}';").first
    tag = Tag.new(id: result['id'], content: result['content'])
  end

end
