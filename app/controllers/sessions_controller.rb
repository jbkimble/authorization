class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      redirect_to user_path(@user)
    else
      render :login
    end
  end

  def logout
  end

end
