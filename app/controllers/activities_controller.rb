class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:edit, :update, :show, :destroy]
    before_action :require_login, only: [:new, :index, :create, :edit, :show, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]

    def index
       @activities = Activity.paginate(page: params[:page], per_page: 5)
    end

    def new
        @activity = Activity.new
    end

    def edit

    end

    def create
      # render plain: params[:activity].inspect
      #debugger
      @activity = Activity.new(activity_params)
      @activity.user = current_user
       #@activity.save
      # redirect_to activities_path(@activity)
      if @activity.save
          flash[:success] = 'activity was successfully created'
          redirect_to activity_path(@activity)
      else
          render 'new'
      end

    end

    def show


    end

    def destroy
       @activity.destroy
       flash[:danger] = "activity was successfully deleted"
       redirect_to activities_path
    end

    def update

        if @activity.update(activity_params)
            flash[:success] = "activity was successfully updated"
            redirect_to activity_path(@activity)
        else
            render "edit"
        end
    end

    private
        def set_activity
            @activity = Activity.find(params[:id])
        end

        def activity_params
            params.require(:activity).permit(:pen_id, :check_in, :check_out, :total_num, :pull_num, :dead_num,
            :feed_check, :feed_comment, :water_check, :water_comment, :mud_check, :mud_comment, :maintenance_check, :maintenance_comment)
        end


        def require_login
          if !logged_in?
            flash[:danger] = "Please login first to perform that action"
            redirect_to root_path
          end
        end

        def require_same_user
            if current_user != @activity.user and !current_user.admin?
                flash[:danger] = "You can only edit or delete your own activities"
                redirect_to root_path
            end
        end

        def require_admin
           if logged_in? and !current_user.admin?
              flash[:danger] = "Only admin users can perform that action"
              redirect_to root_path
           end
         end

end
