module NewsHelper

  # Returns the Gravatar for the given user.
  def news_beginning(content)
    content.length > 250 ? content[0..250] + ' ...' : content
  end
end
