class UsersController < ApplicationController
   before_action :set_user, only: [ :edit, :update, :show]
   before_action :require_login, only: [:new, :index, :create, :edit, :show, :update, :destroy]
   before_action :require_same_user, only: [:edit, :update]
   before_action :require_admin, only: [:new, :create, :destroy]

   def index
      @users = User.paginate(page: params[:page], per_page: 5)
   end

   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         flash[:success] = "Welcome to the Diagle System #{@user.username}"
         redirect_to user_path(@user)
      else
         render 'new'
      end
   end

   def edit
   end

   def update
      if @user.update(user_params)
         flash[:success] = "Your account was updated successfully"
         redirect_to activities_path
      else
         render 'edit'
      end
   end

   def show
      @user_activities = @user.activities.paginate(page: params[:page], per_page: 5)
   end

   def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all activities created by user have been deleted"
      redirect_to users_path
   end

   private
   def user_params
      params.require(:user).permit(:username, :password, :cowboy, :handy, :doctor,
                                   :first_name, :last_name,:email, :phone, :address)
   end

   def set_user
     @user = User.find(params[:id])
   end

   def require_login
     if !logged_in?
       flash[:danger] = "Please login first to perform that action"
       redirect_to root_path
     end
   end

   def require_same_user
      if current_user != @user and !current_user.admin?
         flash[:danger] = "You can only edit your own account"
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
