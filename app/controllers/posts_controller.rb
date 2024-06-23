class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.post_image.attach(params[:post][:post_image])
    @post.save
    redirect_to post_path(@post.id)
  end  

  def index
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

  private

   def post_params
     params.require(:post).permit(:title, :body, :post_image)
   end

   def is_matching_login_user
     post = Post.find(params[:id])
     unless post.user_id == current_user.id
       redirect_to posts_path
     end
   end 

end