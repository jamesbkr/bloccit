 class Api::V1::UsersController < Api::V1::BaseController
   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     post = Post.find(params[:id])
     render json: {post: :post.to_json, comments: :post.comments.to_json, votes: :post.votes.to_json, favorites: :post.favorites.to_json}, status: 200

     
    #  render json: {
    #      post: post,
    #      comments: 
    #  }, status 200
   end
 
   def index
     posts = Posts.all
     render json: posts.to_json, status: 200
   end
   
   
 def update
     post = Post.find(params[:id])
     
     if post.update_attributes(post_params)
         render json: post.to_json, status: 200
     else
         render json: {error: "post update failed", status: 400}, status: 400
     end
 end
 
 def create
    post = Post.new(post_params)
 
       if post.valid?
          post.save!
          render json: post.to_json, status: 201
         else
           render json: {error: "post is invalid", status: 400}, status: 400
       end
 end
 
 def destroy
      post = Post.find(params[:id])
 
     if post.destroy
       render json: {message: "post destroyed", status: 200}, status: 200
     else
       render json: {error: "post destroy failed", status: 400}, status: 400
     end
 end
 
 private
    def post_params
        params.require(:post).permit(:title, :body)
    end
   
 end
 