class CrossroadsController < ApplicationController
  def home
    @news = News.where('sphere = 1').paginate(page: params[:page])
  end

  def about
  end

  def contact
    get_message
  end

  def create_message
    create_new_message(crossroads_contact_path)
  end

  def signup
    get_new_user
  end

  def create_user
    create_new_user(crossroads_signup_path)
  end
end
