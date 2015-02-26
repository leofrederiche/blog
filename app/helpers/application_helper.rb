module ApplicationHelper

  def nav
    if current_user
      render "layouts/nav_with_user"
    else
      render "layouts/nav_without_user"
    end
  end

end
