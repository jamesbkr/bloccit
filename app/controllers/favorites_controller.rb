class FavoritesController < ApplicationController
    before_action :require_sign_in
    
    def create
        post = Post.find(params[:post_id])
        
        favorite = current_user.favorites.build(post: post)
        
        if favorite.save
            flash[:notice] = "post favorited"
        else
            flash[:error]= "error favoriting post"
        
        end
        redirect_to [post.topic, post]
    
    end
    
    def destroy
       post = Post.find(params[:post_id])
       favorite = current_user.favorites.find(params[:id])
       
       if favorite.destroy
           flash[:notice]="no longer your favorite"
       else
           flash[:error]="could not undfavorite this post"
       end
       redirect_to [post.topic, post]
    end
end