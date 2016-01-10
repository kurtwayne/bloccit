class PostsController < ApplicationController
  def index
# We declare an instance variable @posts and assign it a collection of Post
# objects using the all method provided by ActiveRecord. all returns a collection
# of Post objects.
    @posts = Post.all
    @posts.each_with_index do |post, index|
      if (index % 5 == 0) then
        puts post.title = "SPAM"
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end
end
