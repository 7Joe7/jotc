class SoftwareController < ApplicationController
  def home
    @news = News.where('sphere % 2 == 0').paginate(page: params[:page])
  end

  def contact
  end

  def about
  end
end
