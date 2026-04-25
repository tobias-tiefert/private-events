module ApplicationHelper
  def navigation_item(name, path)
    if current_page?(path)
      tag.span name, class: "navigation-item navigation-item--active"
    else
      tag.span name, class: "navigation-item"
    end
  end
end
