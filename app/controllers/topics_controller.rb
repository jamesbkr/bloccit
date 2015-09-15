class TopicsController < ApplicationController
  
   before_action :require_sign_in, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]
    
    
    def index
        @topics = Topic.visible_to(current_user)
    end
    def show
        @topic = Topic.find(params[:id])
       
       
        unless @topic.public || current_user
        flash[:error] = "you must be signed in to view the rivate topic"
        redirect_to new_session_path
        end
    end
    def new
        @topic = Topic.new
    end
    def create
    @topic = Topic.new(topic_params)

        if @topic.save
            @topic.labels = Label.update_labels(params[:topic][:labels])
            redirect_to @topic, notice: "topic was saved successfully"
        else
            flash[:error] = "there was an error saving your file.  Please try again"
            render :new
        end
    end
    def edit 
        @topic = Topic.find(params[:id])
    
    end
    
    def update
        @topic = Topic.find(params[:id])
       @topic.assign_attributes(topic_params)
        
        if @topic.save
            @topic.labels = Label.update_labels(params[:topic][:labels])
            redirect_to @topic, notice: "topic was saved successfully"
        else
            flash[:error] = "there was an error saving your file.  Please try again"
            render :edit
        end
    end
    def destroy
        @topic = Topic.find(params[:id])
        if @topic.destroy
            flash[:notice] = "\"#{@topic.name}\" was deleted successfully"
            redirect_to action: :index
        else
            flash[:error] = 'There was an error deleting your topic'
            render :show
        end
    end
    
    private
        def topic_params
            params.require(:topic).permit(:name, :description, :public)
        end
    def authorize_user
        
     unless current_user.admin?
       flash[:error] = "You must be an admin to do that."
       redirect_to topics_path
     end
    end



end
