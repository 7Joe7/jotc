class BasicInformationController < ApplicationController
  def home

  end

  def contact
    @message = logged_in? ? current_user.messages.build : Message.new
  end
end
