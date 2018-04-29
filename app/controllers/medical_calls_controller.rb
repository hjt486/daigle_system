class MedicalCallsController < ApplicationController
    #before_action :set_medical_call, only: [:edit, :update, :show, :destroy]
    before_action :require_login, only: [:new, :index, :create]
    #before_action :require_same_user, only: [:edit, :update]
    #before_action :require_admin, only: [:destroy]

    def index
       @activities = Activity
       @pens = Pen
       @new_medical_call = Medical_call.new
       @users = User
       #select('DISTINCT ON ("group") *').order(:group, date: :desc, id: :desc)
       @medical_calls = Activity.joins('LEFT OUTER JOIN "medical_calls" ON "activities"."id" = "medical_calls"."activity_id"').group("pen_id").select('activities.*').order(:pen_id, id: :desc)
       #select('DISTINCT ON ("pen_id") *').order(:activity_id, checkout: :desc, id: :desc)
       #select("activities.*").group("activities.pen_id").order("activities.check_out DESC").limit(1)
       #@medical_calls = Activity.joins('LEFT OUTER JOIN "medical_calls" ON "activities"."id" = "medical_calls"."activity_id"').select("activities.*").group("activities.pen_id").order("activities.check_out DESC").limit(1)
       @medical_calls = @medical_calls.having("pen_pull_num > '0' and (medical_calls.resolved = 'f' or medical_calls.resolved is NULL)")
       #@medical_calls = @medical_calls.where("medical_calls.resolved = 'true' or medical_calls.resolved is NULL")
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


        def require_login
          if !logged_in?
            flash[:danger] = "Please login first to perform that action"
            redirect_to root_path
          end
        end

        def require_same_user
            if current_user != @medical_call.user and !current_user.admin?
                flash[:danger] = "You can only edit or delete your own medical_calls"
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
