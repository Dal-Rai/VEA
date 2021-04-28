module CourseFilter
  extend ActiveSupport::Concern

  def english_qualifier(user)
    qualified = []

    english_competencies.each do |eng|
      qualified.push(user
                     .english_competencies
                     .send(eng.competency_type)
                     .active
                     .where('overall_band >= ? AND speaking >= ? AND  writing >= ? AND writing >= ? AND listening >= ?',
                       eng.overall_band, eng.speaking, eng.writing, eng.writing, eng.listening).first&.id)

    end

    user.english_competencies.where(id: qualified.compact)
  end

  def academic_qualified?(user)
    qualified = true

    subjects.each do |sub|
      user_sub = user.subjects.find_by(name: sub.name)
      qualified = false if user_sub.nil? || user_sub.percentage < sub.percentage
    end

    return qualified
  end

  def english_qualified?(user)
    english_qualifier(user).present?
  end

  def budget_qualified?(user)
    category = user.category_preferances.find_by(course_category_id: course_category_id)
    category.nil? ? true : category.fees > total_fees
  end

  def qualifies?(user)
    academic_qualified?(user) && english_qualified?(user) && budget_qualified?(user)
  end

  def course_acceptance_rate
    total_accepted = application_progresses.enrolled.count
    (total_accepted/course_popularity) * 100
  end

  def course_popularity
    application_progresses.count
  end

  def faculty_popularity
    course_category.application_progresses.count
  end

  def total_weightage

  end

end
