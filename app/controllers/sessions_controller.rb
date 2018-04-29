class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
              if current_user.admin == 1
                redirect_to pens_path
              elsif current_user.cowboy == 1
                redirect_to activities_path
              elsif current_user.handy == 1
                redirect_to maintenances_path
              elsif current_user.doctor == 1
                redirect_to medical_calls_path
              else
                redirect_to activities_path
              end
        else
            flash.now[:danger] = "There was something wrong with your login information "
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end
