require 'rubygems'
require File.join(File.dirname(__FILE__), 'app.rb')
require File.dirname(__FILE__) + '/lib/bookmark.rb'

use Rack::MethodOverride

run BookmarkManager
