class CourseUpdateForm < SimpleDelegator
  attr_accessor(
    :course,
    :params,
    :course_params
  )

  def initialize(course, params)
    __setobj__(course)
    @params = params
    @course_params = filter_params
  end

  def assign_default_english
    self.english_competencies.new(course_params[:english_competencies_attributes].merge!(competency_type:
      params[:competency_type]))
  end

  def assign_default_subject
    self.subjects.new(course_params[:subjects_attributes])
  end

  def assign_default_course
    self.course_category_id =  params[:course_category_id]
    self.rank =  params[:rank]
    self.assign_attributes(filter_params)
  end

  def update
    send('assign_default_'+params[:type].keys.first)
    self.save
  end

  def filter_params
    params.require(:course).permit(:name, :code, :duration, :rank, :faculty_id, :total_fees, :course_category_id,
      english_competencies_attributes: [:overall_band, :expiry, :competency_type, :speaking, :listening, :writing,
        :reading],
      subjects_attributes: [:name, :percentage, :description])
  end
end