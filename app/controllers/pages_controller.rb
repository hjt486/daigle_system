class PagesController < ApplicationController
    def home
        if logged_in?
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
        end

    end

    def about

    end
end
