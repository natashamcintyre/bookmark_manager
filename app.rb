require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/save_bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    p "Bookmark saved!"
    redirect '/bookmarks'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
