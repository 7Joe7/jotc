class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or params[:session][:from_url]
      else
        flash[:warning] = 'Account not activated. Check your email for the activation link.'
        redirect_to params[:session][:from_url]
      end
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to params[:session][:from_url]
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to params[:from_url]
  end
end
