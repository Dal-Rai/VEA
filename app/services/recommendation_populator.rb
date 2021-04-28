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
    mla_courses = select_courses_mla(filtered_courses)
    final_courses = mla_courses.empty? ? filtered_courses : mla_courses
    Course.where(id: final_courses.map(&:id)).order(total_weightage: :desc)
  end

  def select_courses_mla(courses)
    return [] if student.highest_english_competency.nil? || student.highest_qualification.nil?
    ml_courses = KnnBallAlgorithm.new({courses: courses, user_data: user_data}).limit_result(10)
    Course.where(id: ml_courses.map{|x| x[:id]})
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

  private

  def user_data
    [student.highest_english_competency&.overall_band, student.highest_qualification&.overall_percentage]
  end



end