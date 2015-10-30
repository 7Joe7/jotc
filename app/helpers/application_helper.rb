module ApplicationHelper

  BASE_TITLE = 'JOT'
  JOT_MAIL = 'jot.company@gmail.com'

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
    get_sphere_from(:controller) || get_sphere_from(:from_controller)
  end

  def get_sphere_from(param)
    if params[param] == 'crossroads' || params[param] == 'lessons' || params[param] == 'software'
      params[param]
    elsif params[param] == 'chess' || params[param] == 'reservations'
      'lessons'
    end
  end
end
