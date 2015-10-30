class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :log_visit

  private

  # VISITS

  def log_visit
    v = Visit.new
    v.page = "#{params[:controller]} - #{params[:action]}"
    v.ip = request.remote_ip
    v.save
  end

  # USERS

  def get_new_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create_new_user(redirect_to)
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to redirect_to
    else
      render 'signup'
    end
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # MESSAGES

  def get_message
    @message = logged_in? ? current_user.messages.build : Message.new
  end

  def message_params
    params.require(:message).permit(:content, :email)
  end

  def create_new_message(redirect_to)
    @message = logged_in? ? current_user.messages.build(message_params) : Message.new(message_params)
    if @message.save
      @message.send_new_message
      flash[:success] = "Message sent. We'll contact you as soon as we process your message."
      sphere = message_sphere
      sphere == 'crossroads' ? redirect_to(redirect_to) : redirect_to(send("#{sphere}_url"))
    else
      render 'contact'
    end
  end

  def message_sphere
    params.require(:message).permit(:sphere)[:sphere]
  end
end
