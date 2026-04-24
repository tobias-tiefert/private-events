module ApplicationHelper
  def navigation_item(name, path)
    if current_page?(path)
      link_to name, path, class: "navigation-item navigation-item--active"
    else
      link_to name, path, class: "navigation-item"
    end
  end
end
