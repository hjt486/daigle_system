class MudCallsController < ApplicationController
    #before_action :set_mud_call, only: [:edit, :update, :show, :destroy]
    #before_action :require_login, only: [:new, :index, :create]
    before_action :require_admin_or_role, only: [:new, :index, :create]
    #before_action :require_admin, only: [:destroy]

    def index
       @activities = Activity
       @pens = Pen
       @new_mud_call = Mud_call.new
       @users = User
       @mud_calls = Activity.find_by_sql("select x.id, x.user_id, x.pen_id, x.created_at, x.pen_mud_check, y.resolved
       from(
       select a.id, a.pen_id, a.created_at, a.user_id, a.pen_mud_check from (
       select max(activities.created_at) as created_at from activities group by activities.pen_id
       ) as b
       inner join activities as a on a.created_at = b.created_at) as x
       left outer join mud_calls as y on x.id = y.activity_id
       where x.pen_mud_check = 0 and (y.resolved = 0 or y.resolved is NULL)")
       @mud_calls = @mud_calls.paginate(page: params[:page], per_page: 4)

       #.paginate(page: params[:page], per_page: 5)
    end

    def create
      # render plain: params[:mud_call].inspect
      #debugger
      @new_mud_call = Mud_call.new(mud_call_params)
      @new_mud_call.user = current_user
       #@mud_call.save
      # redirect_to mud_calls_path(@mud_call)
      if @new_mud_call.save
          flash[:success] = 'mud_call was successfully created'
          redirect_to mud_calls_path
      else
          render 'new'
      end

    end

    private
        def set_mud_call
            @mud_call = Mud_call.find(params[:id])
        end

        def mud_call_params
            params.require(:mud_call).permit(:resolved, :activity_id)
        end


        def require_login
          if !logged_in?
            flash[:danger] = "Please login first to perform that action"
            redirect_to root_path
          end
        end

        def require_same_user
            if current_user != @maintenance.user and current_user.admin == 0
                flash[:danger] = "You can only edit or delete your own mud_calls"
                redirect_to root_path
            end
        end

        def require_admin_or_role
           if !logged_in?
              flash[:danger] = "Please login first to perform that action"
              redirect_to root_path
           elsif logged_in? and current_user.admin == 0 and current_user.handy == 0
              flash[:danger] = "Only admin and yard technician can perform that action"
              redirect_to root_path
           end
         end

end
