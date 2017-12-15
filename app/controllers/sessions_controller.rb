class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def create
    user = User.find_by(email: params[:email])
    # find by email
    if user
      if user.try(:authenticate, params[:password])
        # if the user matches a user in the database, set the session id to the user being authenticated
        session[:user_id] = user.id
        return redirect_to songs_path
      end
      flash[:errors] = ["Invalid password"]
    else
      flash[:errors] = ["Invalid email"]
    end
    return redirect_back fallback_location: root_path
  end
  def destroy
    reset_session
    redirect_to root_path
  end
end
