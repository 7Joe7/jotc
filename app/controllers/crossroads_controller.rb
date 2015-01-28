class CrossroadsController < ApplicationController
  def home
    @news = News.paginate(page: params[:page])
  end

  def about

  end

  def contact
    get_message
  end

  def feedback
    get_message
  end

  def report_bug
    get_message
  end
end
