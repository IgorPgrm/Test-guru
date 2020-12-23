class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    redirect_path = cookies[:redirect_path]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if redirect_path.present?
      cookies.delete(:redirect_path)
      redirect_to redirect_path
      else
        redirect_to tests_path
      end
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
