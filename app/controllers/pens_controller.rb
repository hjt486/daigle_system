class PensController < ApplicationController
    before_action :set_pen, only: [:edit, :update, :show, :destroy]
    before_action :require_admin, only: [:new, :index, :create, :edit, :show, :update, :destroy]

    def index
       @pens = Pen.paginate(page: params[:page], per_page: 5)
       @activities = Activity.paginate(page: params[:page], per_page: 5)
    end

    def new
        @pen = Pen.new
    end

    def edit

    end

    def create
      # render plain: params[:activity].inspect
      #debugger
      @pen = Pen.new(pen_params)
      @pen.user = current_user
       #@activity.save
      # redirect_to activities_path(@activity)
      if @pen.save
          flash[:success] = 'Pen was successfully created'
          redirect_to pen_path(@pen)
      else
          render 'new'
      end

    end

    def show


    end

    def destroy
       @pen.destroy
       flash[:danger] = "Pen was successfully deleted"
       redirect_to pen_path
    end

    def update

        if @pen.update(pen_params)
            flash[:success] = "pen was successfully updated"
            redirect_to pen_path(@pen)
        else
            render "edit"
        end
    end

    private
        def set_pen
            @pen = Pen.find(params[:id])
        end

        def pen_params
            params.require(:pen).permit(:num, :total_num)
        end

        def require_admin
           if logged_in? and !current_user.admin?
              flash[:danger] = "Only admin users can perform that action"
              redirect_to root_path
           end
         end

end
