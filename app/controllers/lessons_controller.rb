class LessonsController < ApplicationController
  def home
    @news = News.where('sphere = 3').paginate(page: params[:page])
  end

  def contact
    get_message
  end

  def about
  end

  def links
  end

  def price_list
  end

  def learning_concepts
  end
end
