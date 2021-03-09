require 'active_record'

class Tag < ActiveRecord::Base

  has_many :bookmark_tags
  has_many :bookmarks, through: :bookmark_tags

end
