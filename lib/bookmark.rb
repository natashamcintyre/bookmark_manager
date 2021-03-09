require 'pg'
require 'active_record'
require_relative './comment.rb'
require_relative './tag.rb'
require_relative './bookmarktag.rb'

class Bookmark < ActiveRecord::Base

  has_many :bookmark_tags
  has_many :tags, through: :bookmark_tags
  has_many :comments

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
