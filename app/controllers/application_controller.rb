class ApplicationController < ActionController::Base
    #before_action :authenticate_user!,except: [:new,:create]
    helper_method :current_user
    #before_action :require_login

    #include SessionHelper

  

    def current_user
        if session[:user_id]
          @current_user = User.find(session[:user_id])
        else
          @current_user = nil
        end
    end

    def authenticate_user!
      current_user
      redirect_to root_url unless @current_user
    end
    
    private

    def require_login
      unless signed_in?
        flash[:danger] = "You must log in"
        redirect_to :mersen_input
      end
    end
end
