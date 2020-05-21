module ApplicationHelper
  def post_list(posts)
    if posts.nil?
      []
    else
      posts
    end
  end

  def comment_list(comms)
    if comms.empty?
      []
    else
      comms
    end
  end
end
