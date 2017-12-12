class SessionsController < ApplicationController
  before_action :ensure_signed_out, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    username = user_params[:username]
    password = user_params[:password]

    user = User.find_from_credentials(username, password)

    if user
      sign_in(user)
      flash[:error] = 'User not found'
      @user = User.new(username: username)
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'You signed out!'
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
