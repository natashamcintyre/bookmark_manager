class BookmarkTag

  def self.create(bookmark_id:, tag_id:)
    result = DatabaseConnection.query("INSERT INTO bookmarktags (bookmark_id, tag_id) VALUES(#{bookmark_id}, #{tag_id}) RETURNING id, bookmark_id, tag_id;")
    BookmarkTag.new(
      id: result[0]['id'],
      bookmark_id: result[0]['bookmark_id'],
      tag_id: result[0]['tag_id']
    )
  end

  attr_reader :id, :bookmark_id, :tag_id

  def initialize(id:, bookmark_id:, tag_id:)
    @id = id
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end

end
