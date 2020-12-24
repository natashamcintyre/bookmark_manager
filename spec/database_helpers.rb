require 'pg'

def persisted_data(table:, id:)
  conn = PG.connect(dbname: 'bookmark_manager_test')
  result = conn.query("SELECT * FROM #{table} WHERE id=#{id};")
  result.first
end
