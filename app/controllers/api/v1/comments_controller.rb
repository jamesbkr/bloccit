 class Api::V1::UsersController < Api::V1::BaseController
   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     comment = Comment.find(params[:id])
     render json: comment.to_json, status: 200
   end
 
   def index
     comment = comments.all
     render json: comments.to_json, status: 200
   end
 end