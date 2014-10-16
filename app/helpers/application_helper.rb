module ApplicationHelper

  BASE_TITLE = 'JOTC'

  def full_title(specific_title)
    if specific_title
      "#{BASE_TITLE} | #{specific_title}"
    else
      BASE_TITLE
    end
  end
end
