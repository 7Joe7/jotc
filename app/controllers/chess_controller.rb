class ChessController < ApplicationController
  def tactics
  end

  def famous_games
  end

  def tips

  end

  def bohemka
    @news = News.where('sphere = 4').paginate(page: params[:page])
  end
end
