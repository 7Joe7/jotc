module ApplicationHelper

  BASE_TITLE = 'JOT'

  def full_title(title)
    sphere = get_sphere.capitalize
    if !title.blank? && !sphere.blank?
      "#{BASE_TITLE} | #{sphere} | #{title}"
    elsif !title.blank?
      "#{BASE_TITLE} | #{title}"
    elsif !sphere.blank?
      "#{BASE_TITLE} | #{sphere}"
    else
      BASE_TITLE
    end
  end

  def get_message_kind
    "#{get_sphere}/#{params[:action]}_text"
  end

  def get_sphere
    if params[:controller] == 'crossroads' || params[:controller] == 'lessons' || params[:controller] == 'software'
      params[:controller]
    elsif params[:controller] == 'chess' || params[:controller] == 'reservations'
      'lessons'
    end
  end
end
