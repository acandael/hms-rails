module ApplicationHelper
  def page_title
    if content_for?(:title)
      "Health, Media & Society - #{content_for(:title)}"
    end
  end

  def page_description
    if content_for?(:description)
      content_for(:description)
    end
  end

  def options_for_categories
    Category.all.map { |category| [category.name, category.id] }
  end
end
