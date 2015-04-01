class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
 
    def authenticate_active_admin_user!
        authenticate_user!
        unless current_user.role?(:administrator)
            flash[:alert] = "You are not authorized to access this resource!"
            redirect_to root_path
        end
    end

     # Catch all CanCan errors and alert the user of the exception
    rescue_from CanCan::AccessDenied do | exception |
      redirect_to root_url, alert: exception.message
    end

end