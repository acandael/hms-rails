module ApplicationHelper
  def page_title
    if content_for?(:title)
      "AdLit - #{content_for(:title)}"
    end
  end
end
