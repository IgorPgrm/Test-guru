class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    redirect_path = cookies[:redirect_path]
    cookies.delete(:redirect_path)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to redirect_path || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your e-mail and password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:user_id)
    user = nil
    redirect_to root_path
  end
end
