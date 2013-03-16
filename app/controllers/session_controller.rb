class SessionController < ApplicationController
  def new
  end
  def create
    user = User.where(:email => params[:email]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      @auth = User.find(session[:user_id]) if session[:user_id].present?
      #Here the user is now logged in so let's redirect to "MAIN"
      redirect_to(users_path) #users_path is mian
    else
      session[:user_id] = nil
    end
  end

  def destroy
    session[:user_id] = nil
    @auth = nil
  end
end
