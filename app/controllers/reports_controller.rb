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

    def show
       @activities = Activity
       @users = User
       @pens = Pen
       @reports = @activities.where(["created_at LIKE ?", "%#{params[:string_form][:date]}%"]).paginate(page: params[:page], per_page: 5)
       #@reports = @activities.find(:all, :conditions => "created_at >= to_timestamp(?)", "%#{params[:date_form][:date]}%").paginate(page: params[:page], per_page: 5)
    end



    private


        def require_login
          if !logged_in?
            flash[:danger] = "Please login first to perform that action"
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
