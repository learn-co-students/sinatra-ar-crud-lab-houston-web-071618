
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  def posts
    Post.all
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  post '/posts' do
    Post.create(params[:post])
    # binding.pry
    erb :index
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])

    post.update(params[:post])

    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id])

    # redirect "/posts/#{params[:id]}"
    erb :delete
  end

end
