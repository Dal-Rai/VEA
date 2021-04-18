class RecommendationPopulator
  attr_accessor(
    :student,
    :courses
  )
  def initialize(user)
    @student = user
  end

  def recommended_courses
    courses.empty? ? suggested_courses : preferred_courses
  end

  def suggested_courses
    Course.all
  end

  def preferred_courses
    courses.select{|course| course.qualifies?(student)}
  end

  private

  def courses
    @courses ||= Course.where(
      course_category_id: student.category_preferances.pluck(:course_category_id),
      rank: student.current_qualification_code + 1
    )
  end

end