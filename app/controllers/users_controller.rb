class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      return redirect_to songs_path
    else
      flash[:errors] = user.errors.full_messages
      return redirect_back fallback_location: root_path
    end
  end
  def show
    @user = User.find(params[:id])
    @songs = Song.all
  end
  private
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
    end
end
