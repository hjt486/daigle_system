class MedicalCallsController < ApplicationController
    #before_action :set_medical_call, only: [:edit, :update, :show, :destroy]
    #before_action :require_login, only: [:new, :index, :create]
    before_action :require_admin_or_role, only: [:new, :index, :create]
    #before_action :require_admin, only: [:destroy]

    def index
       @activities = Activity
       @pens = Pen
       @new_medical_call = Medical_call.new
       @users = User
       @medical_calls = Activity.find_by_sql("select x.id, x.user_id, x.pen_id, x.created_at, x.pen_pull_num, y.resolved
       from(
       select a.id, a.pen_id, a.created_at, a.user_id, a.pen_pull_num from (
       select max(activities.created_at) as created_at from activities group by activities.pen_id
       ) as b
       inner join activities as a on a.created_at = b.created_at) as x
       left outer join medical_calls as y on x.id = y.activity_id
       where x.pen_pull_num > 0 and (y.resolved = 0 or y.resolved is NULL)")
       @medical_calls = @medical_calls.paginate(page: params[:page], per_page: 4)

       #.paginate(page: params[:page], per_page: 5)
    end

    def create
      # render plain: params[:medical_call].inspect
      #debugger
      @new_medical_call = Medical_call.new(medical_call_params)
      @new_medical_call.user = current_user
       #@medical_call.save
      # redirect_to medical_calls_path(@medical_call)
      if @new_medical_call.save
          flash[:success] = 'medical_call was successfully created'
          redirect_to medical_calls_path
      else
          render 'new'
      end

    end

    private
        def set_medical_call
            @medical_call = Medical_call.find(params[:id])
        end

        def medical_call_params
            params.require(:medical_call).permit(:resolved, :activity_id)
        end

        def require_admin_or_role
           if !logged_in?
              flash[:danger] = "Please login first to perform that action"
              redirect_to root_path
           elsif logged_in? and current_user.admin == 0 and current_user.doctor == 0
              flash[:danger] = "Only admin and medical technician can perform that action"
              redirect_to root_path
           end
         end

end
