require 'active_record'

class Comment < ActiveRecord::Base

  belongs_to :bookmark

end
