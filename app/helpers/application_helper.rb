module ApplicationHelper
  def navigation_item(name, path)
    if current_page?(path)
      tag.span name, class: "navigation-item navigation-item--active"
    else
      tag.span name, class: "navigation-item"
    end
  end

  def login_navigation
    if authenticated?
      render "application/logout"
    else
     render "application/login_or_sign_up"
    end
  end
end
