class RecommendationPopulator
  attr_accessor(
    :student,
    :courses
  )
  def initialize(user)
    @student = user
  end

  def recommended_courses
    courses = preferred_courses
    if courses.empty?
      courses = suggested_courses
    end
    courses = filter_courses(courses)

    if student.premium_member?
      courses
    elsif student.basic_member?
      courses.take(10)
    else
      courses.take(5)
    end
  end

  def filter_courses(courses)
    filtered_courses = courses.select{|course| course.qualifies?(student)}
    filtered_courses.order(total_weightage: :desc)
  end

  private

  def preferred_courses
    @courses ||= Course.where(
      course_category_id: student.category_preferances.pluck(:course_category_id),
      rank: student.future_qualification_number
    )
  end

  def suggested_courses
    Course.where(rank: student.future_qualification_number)
  end

end