class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
    @created_past_events = current_user.events.past_events
    @created_upcomming_events = current_user.events.comming_events
    @upcomming_events = current_user.user_comming_events
    @past_events = current_user.user_past_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
