
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #loads new form
    erb :'posts/new'
  end

  get '/posts' do
    @posts = Post.all

    erb :'posts/index'
  end

  post '/posts' do  #creates a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :'posts/edit'
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])

    post.update(params[:post])

    erb :show
    # redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id' do
    post = Post.find(params[:id])
    post.destroy

    redirect '/posts'
  end

end
