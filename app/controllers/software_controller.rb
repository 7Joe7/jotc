class SoftwareController < ApplicationController
  def home
    @news = News.where('sphere % 2 = 0').paginate(page: params[:page])
  end

  def contact
    get_message
  end

  def about
  end
end
