require 'active_record'

class BookmarkTag < ActiveRecord::Base

  belongs_to :bookmark
  belongs_to :tag

end
