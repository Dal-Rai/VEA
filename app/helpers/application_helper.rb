module ApplicationHelper
  def header_nav
    if current_user.nil?
      render(partial: "home/home_nav")
    else
      render(partial: "home/"+current_user.user_type+"_nav")
    end
  end
end
