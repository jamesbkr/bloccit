 class Api::V1::UsersController < Api::V1::BaseController
   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     post = Post.find(params[:id])
     render json: post.to_json, status: 200
     render json: post.comments.to_json, status: 200
   end
 
   def index
     posts = Posts.all
     render json: posts.to_json, status: 200
   end
 end