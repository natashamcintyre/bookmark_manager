require 'active_record'

if ENV['RACK_ENV'] == 'test'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'bookmark_manager_test'
  )
else
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'bookmark_manager'
  )
end
