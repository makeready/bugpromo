class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])  #automatically checks vs the password_digest
      session[:user_id] = user.id
      redirect_to sheets_path
    else
      flash.now[:alert] = "Invalid login credentials. Please try again."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sheets_path
  end
end
