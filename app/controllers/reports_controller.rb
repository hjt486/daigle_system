class ReportsController < ApplicationController
    #before_action :set_doctor, only: [:edit, :update, :show, :destroy]
    #before_action :require_login, only: [:new, :index, :create]
    before_action :require_admin, only: [:new, :index, :create]
    #before_action :require_same_user, only: [:edit, :update]
    #before_action :require_admin, only: [:destroy]

    def index

       @activities = Activity
       @users = User
       @pens = Pen
       @reports = @activities.paginate(page: params[:page], per_page: 5)
    end

    private

        def require_admin
           if logged_in? and !current_user.admin?
              flash[:danger] = "Only admin users can perform that action"
              redirect_to root_path
           end
        end

end
