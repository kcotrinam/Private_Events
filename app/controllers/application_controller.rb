class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_validation
  helper_method :user_signed_in?
  helper_method :show_user_name

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def user_validation
    return 'Log out' if user_signed_in?

    'signed_in'
  end

  def show_user_name
    return current_user.name if current_user
  end
end
