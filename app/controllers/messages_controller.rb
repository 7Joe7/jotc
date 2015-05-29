class MessagesController < ApplicationController

  include ApplicationHelper

  def new
    get_message
  end

  def create
    @message = logged_in? ? current_user.messages.build(message_params) : Message.new(message_params)
    if @message.save
      @message.send_new_message
      flash[:success] = "Message sent. We'll contact you as soon as we process your message."
      sphere = message_sphere
      sphere == 'crossroads' ? redirect_to root_url : redirect_to send("#{sphere}_url")
    else
      render 'new'
    end
  end

  def destroy
  end
end
