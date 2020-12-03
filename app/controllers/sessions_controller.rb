class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user
      session[:creator_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Email incorrect'
      render :new
    end
  end

  def destroy
    session[:creator_id] = nil
    redirect_to login_path, notice: 'Logged out!'
  end
end
