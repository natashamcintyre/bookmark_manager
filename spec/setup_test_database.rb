require 'pg'
require 'active_record'

def setup_test_database
    p "Setting up test database..."

    ActiveRecord::Base.connection.execute("TRUNCATE bookmarks, comments, tags, bookmark_tags;")
end
