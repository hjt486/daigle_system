class activitiesController < ApplicationController
    before_action :set_Activity, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
       @activities = Activity.paginate(page: params[:page], per_page: 5)
    end

    def new
        @Activity = Activity.new

    end

    def edit

    end

    def create
      # render plain: params[:Activity].inspect
      #debugger
      @Activity = Activity.new(Activity_params)
      @Activity.user = current_user
       #@Activity.save
      # redirect_to activities_path(@Activity)
      if @Activity.save
          flash[:success] = 'Arctivity was successfully created'
          redirect_to Activity_path(@Activity)
      else
          render 'new'
      end

    end

    def show


    end

    def destroy
       @Activity.destroy
       flash[:danger] = "Activity was successfully deleted"
       redirect_to activities_path
    end

    def update

        if @Activity.update(Activity_params)
            flash[:success] = "Activity was successfully updated"
            redirect_to Activity_path(@Activity)
        else
            render "edit"
        end
    end

    private
        def set_Activity
            @Activity = Activity.find(params[:id])
        end

        def Activity_params
            params.require(:Activity).permit(:title, :description)
        end

        def require_same_user
            if current_user != @Activity.user and !current_user.admin?
                flash[:danger] = "You can only edit or delete your own activities"
                redirect_to root_path
            end
        end

end
