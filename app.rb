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
    redirect '/bookmarks'
  end

  delete '/delete' do
    Bookmark.delete(params[:url_to_delete])
    redirect '/bookmarks'
  end

  get '/update' do
    @bookmark_id = params[:id]
    erb :'bookmarks/update'
  end

  post '/updateme' do
    Bookmark.update(id: params[:id], new_url: params[:url], new_title: params[:title])
    redirect '/bookmarks'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
