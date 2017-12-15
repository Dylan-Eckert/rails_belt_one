class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, except: [:index]

  def index
  end

  def require_login
    return redirect_to root_path unless session[:user_id]
  end
  def current_user
    # ONLY USE THIS IF YOU ARE NEEDING THE FULL USER INFO (name, email, etc) if you are going for an id, just use session[:user_id]
    return User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  helper_method :require_login
end
