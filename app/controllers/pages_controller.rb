class PagesController < ApplicationController
    def home
        redirect_to activities_path if logged_in?
    end

    def about

    end
end
