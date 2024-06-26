class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.image.attach(params[:post][:image])
    @post.save
    redirect_to post_path(@post.id)
  end

  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end  

  private

   def post_params
     params.require(:post).permit(:title, :body, :image)
   end

   def is_matching_login_user
     post = Post.find(params[:id])
     unless post.user_id == current_user.id
       redirect_to posts_path
     end
   end

end
