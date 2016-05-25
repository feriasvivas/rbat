class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
     unless current_user && current_user.is_admin?
       flash[:error] = "Acesso negado."
       redirect_to root_url and return false
     end
   end
end
