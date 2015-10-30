class LessonsController < ApplicationController
  def home
    @news = News.where('sphere = 3').paginate(page: params[:page])
  end

  def contact
    get_message
  end

  def create_message
    create_new_message(lessons_contact_path)
  end

  def about
  end

  def links
  end

  def price_list
  end

  def learning_concepts
  end

  def signup
    get_new_user
  end

  def create_user
    create_new_user(lessons_signup_path)
  end
end
