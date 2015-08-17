class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post=Post.new
  end
  
  def create
      @post = Post.new
      @post.title = params[:post][:title]
      @post.body = params[:post][:body]
      @topic = Topic.find(params[:topic_id])
      
      @post.topic = @topic
  
    if @post.save
        flash[:notice] = "your post was created successfully"
        redirect_to @post.topic
    else 
        flash[:error] = "there was an error in creating this post"
        render :new
    end
  end  

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      flash[:notice] = "Post was updated"
      redirect_to [@post.topic, @post]
    else 
      flash[:error] = "there was an error saving the post.  Please try again."
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "you have deleted the post"
      redirect_to @post.topic
    else
      flash[:error] = "there was an error deleting this post"
      render :show
    end
  end

end
