class ActivitiesController < ApplicationController
    #before_action :set_activity, only: [:edit, :update, :show, :destroy]
    before_action :require_login, only: [:index]
    before_action :require_cowboy, only: [:new, :create]
    #before_action :require_admin, only: [:destroy]

    def index
       @activities = Activity.paginate(page: params[:page], per_page: 5)
       @users = User
       @pens = Pen
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
          redirect_to activities_path
      else
          render 'new'
      end

    end

    def update

        if @activity.update(activity_params)
            flash[:success] = "activity was successfully updated"
            redirect_to activities_path
        else
            render "edit"
        end
    end

    private
        def set_activity
            @activity = Activity.find(params[:id])
        end

        def activity_params
            params.require(:activity).permit(:pen_id, :check_in, :pen_pull_num, :pen_dead_num,
            :pen_feed_check, :pen_water_check, :pen_mud_check, :pen_maintenance_check)
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

        def require_cowboy
           if logged_in? and current_user.cowboy == 0
              flash[:danger] = "Only animal technician can perform that action"
              redirect_to root_path
           end
         end

end
