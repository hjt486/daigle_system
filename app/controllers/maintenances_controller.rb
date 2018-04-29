class MaintenancesController < ApplicationController
    #before_action :set_maintenance, only: [:edit, :update, :show, :destroy]
    #before_action :require_login, only: [:new, :index, :create]
    before_action :require_admin_or_role, only: [:new, :index, :create]
    #before_action :require_admin, only: [:destroy]

    def index
       @activities = Activity
       @pens = Pen
       @new_maintenance = Maintenance.new
       @users = User
       #select('DISTINCT ON ("group") *').order(:group, date: :desc, id: :desc)
       @maintenances = Activity.joins('LEFT OUTER JOIN "maintenances" ON "activities"."id" = "maintenances"."activity_id"').group("pen_id").select('activities.*').order(:pen_id, id: :desc)
       #select('DISTINCT ON ("pen_id") *').order(:activity_id, checkout: :desc, id: :desc)
       #select("activities.*").group("activities.pen_id").order("activities.check_out DESC").limit(1)
       #@maintenances = Activity.joins('LEFT OUTER JOIN "maintenances" ON "activities"."id" = "maintenances"."activity_id"').select("activities.*").group("activities.pen_id").order("activities.check_out DESC").limit(1)
       @maintenances = @maintenances.having("pen_maintenance_check = 1 and (maintenances.resolved = 0 or maintenances.resolved is NULL)")
       #@maintenances = @maintenances.where("maintenances.resolved = 'true' or maintenances.resolved is NULL")
       @maintenances = @maintenances.paginate(page: params[:page], per_page: 4)

       #.paginate(page: params[:page], per_page: 5)
    end

    def create
      # render plain: params[:maintenance].inspect
      #debugger
      @new_maintenance = Maintenance.new(maintenance_params)
      @new_maintenance.user = current_user
       #@maintenance.save
      # redirect_to maintenances_path(@maintenance)
      if @new_maintenance.save
          flash[:success] = 'maintenance was successfully created'
          redirect_to maintenances_path
      else
          render 'new'
      end

    end

    private
        def set_maintenance
            @maintenance = Maintenance.find(params[:id])
        end

        def maintenance_params
            params.require(:maintenance).permit(:resolved, :activity_id)
        end


        def require_login
          if !logged_in?
            flash[:danger] = "Please login first to perform that action"
            redirect_to root_path
          end
        end

        def require_same_user
            if current_user != @maintenance.user and current_user.admin == 0
                flash[:danger] = "You can only edit or delete your own maintenances"
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
