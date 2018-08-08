
require_relative "../../config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/posts/new" do #this loads a new form, the new.erb view
    erb :new
  end

  post "/posts" do #creates a new post
    @post = Post.create(params)
    #this is sending the user to another endpoint. the redirect is sending to the get "/posts" below
    redirect to "/posts"
  end

  get "/posts" do #loads index page
    @posts = Post.all
    #this is sending a response. sending the index page to the user.
    erb :index
  end

  # e.g: /posts/23
  get "/posts/:id" do #loads the show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get "/posts/:id/edit" do #renders the edit.erb view
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch "/posts/:id" do #will update a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete "/posts/:id/delete" do #delete the post
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end
end
