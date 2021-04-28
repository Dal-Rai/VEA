# require 'knnball'

class KnnBallAlgorithm
  include Assigner
  attr_accessor(
    :courses,
    :user_data
  )

  def initialize(attibutes)
    assign_attributes(attibutes)
  end

  def limit_result(count=25)
    index = KnnBall.build(hash_courses)
    return [] if index.nil? || user_data.nil?
    index.nearest(user_data, :limit => count)
  end

  def hash_courses
    hash_record = []
    courses.each do |course|
      course.application_progresses.where('state >= ?', 5).each do |app|
        hash_record.push(hash_course(app))
      end
    end
    hash_record
  end

  def hash_course(app)
    {
      id: app.course_id,
      point: [app.user.highest_english_competency.overall_band, app.user.highest_qualification.overall_percentage]
    }
  end
end