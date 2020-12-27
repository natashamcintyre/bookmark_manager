# GOT UP TO FILTERING BOOKMARKS BY TAGS. NEED TO COMPLETE:
# TAG.BOOKMARKS PART OF THE MANY-MANY RELATIONSHIP
# ADD A GET /TAGS/:ID/BOOKMARKS ROUTE

require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require './database_connection_setup' # separate module setting up database
require 'uri' # to validate urls

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    @tags = Tag.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/save_bookmark' do
    flash[:notice] = "You must submit a valid URL" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/update'
  end

  post '/updateme' do
    Bookmark.update(id: params[:id], new_url: params[:url], new_title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/tags/new' do
    @bookmark_id = params[:id]
    erb :'tags/new'
  end

  post '/bookmarks/:id/tags' do
    tag = Tag.create(content: params[:Tag])
    BookmarkTag.create(bookmark_id: params[:id], tag_id: tag.id)
    redirect '/bookmarks'
  end

  get '/tags/:id/bookmarks' do
    @tag = Tag.find(id: params[:id])
    erb :'tags/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
