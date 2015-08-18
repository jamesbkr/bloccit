class TopicsController < ApplicationController
    
    def index
        @topics = Topic.all
    end
    def show
        @topic = Topic.find(params[:id])
    end
    def new
        @topic = Topic.new
    end
    def create
    @topic = Topic.new(topic_params)

        if @topic.save
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
    
end
