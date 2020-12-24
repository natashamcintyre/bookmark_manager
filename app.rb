# REFACTORING ROUTES TO SAY BOOKMARKS/:ID ETC
# NEED TO UPDATE DELETE AND UPDATE PATHS / MODEL
# THEN ADDING COMMENTS TO BOOKMARKS

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

  post 'bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
