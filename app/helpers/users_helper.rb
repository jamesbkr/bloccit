module UsersHelper
    
    def countPosts
        if @user.posts.count == 0
            "#{@user.name} has not written any posts yet"
        else 
            render @user.posts
        end
    end
    
    def countComments
        if  @user.comments.count == 0
        "#{@user.name} has not written any comemnts yet"
        else 
            render @user.comments
        end
    end
        
end
