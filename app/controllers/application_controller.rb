
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

  post '/posts' do
    Post.create(params)
    erb :index
  end

  post '/posts/:id' do
    @post = Post.all.find {|post_hash| post_hash[:id] == id}

    erb :show
  end
end
