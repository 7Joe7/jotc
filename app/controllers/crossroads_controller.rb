class CrossroadsController < ApplicationController
  def home
    @news = News.paginate(page: params[:page])
  end

  def about
  end

  def contact
    get_message
  end
end
