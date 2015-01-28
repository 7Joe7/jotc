module ApplicationHelper

  BASE_TITLE = 'JOTC'

  def full_title(title, sphere)
    if !title.blank? && !sphere.blank?
      "#{BASE_TITLE} | #{sphere} | #{title}"
    elsif !title.blank? || !sphere.blank?
      "#{BASE_TITLE} | #{title || sphere}"
    else
      BASE_TITLE
    end
  end

  def get_message_kind
    "#{params[:controller]}/#{params[:action]}_text"
  end

  def get_body_class
    params[:controller] == 'crossroads' ? 'crossroads' : nil
  end

end
