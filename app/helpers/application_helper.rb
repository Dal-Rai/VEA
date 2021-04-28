module ApplicationHelper
  def header_nav
    if current_user.nil?
      render(partial: "home/home_nav")
    else
      render(partial: "home/"+current_user.user_type+"_nav")
    end
  end

  def date_format(date, format)
    return if date.nil?
    date.strftime(format)
  end

  def find_university(id)
    University.find_by(id: id)
  end

  def find_course(id)
    Course.find_by(id: id)
  end

  def search_position
    if @results.empty?
      "search-center"
    else
      "search-top"
    end
  end

  def status_color(state)
    if state_pass?(state)
      'green'
    else
      'black'
    end
  end

  def state_pass?(state)
    @application.state_before_type_cast >= state
  end
end
