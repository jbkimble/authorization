class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:create] = "Successfully signed up"
      render :show
    else
      flash[:not_success] = "Womp womp"
      render :new
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_login
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to acces this section"
      redirect_to login_path
    end
  end
end
