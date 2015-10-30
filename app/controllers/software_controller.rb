class SoftwareController < ApplicationController
  def home
    @news = News.where('sphere = 2').paginate(page: params[:page])
  end

  def contact
    get_message
  end

  def create_message
    create_new_message(software_contact_path)
  end

  def about
  end

  def signup
    get_new_user
  end

  def create_user
    create_new_user(software_signup_path)
  end
end
