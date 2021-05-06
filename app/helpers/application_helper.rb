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

  def parent_type(record)
    record.faculty_id.nil? ? "University" : "Course"
  end

  def search_details(record)
    binding.pry
    data = parent_type(record).eql?('University') ? find_university(record.id) : find_course(record.id)
    data.search_detail
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
