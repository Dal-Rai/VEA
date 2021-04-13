class StudentAcademicForm < SimpleDelegator
  attr_accessor(
    :current_user,
    :selection_params,
    :type,
    :criteria_type
  )

  def initialize(current_user, params, type, criteria)
    @current_user = current_user
    @selection_params = params
    @type = type
    @criteria_type = criteria
    set_type
  end

  def assign_default_english
    self.competenciable = current_user
    self.competency_type = criteria_type
  end

  def assign_default_qualification
    self.user = current_user
    self.level = criteria_type
  end

  def assign_default_experience
    self.user =  current_user
  end

  def assign_default_preferance
    self.user =  current_user
    self.course_category_id = selection_params
  end

  def save
    send('assign_default_'+type)
    super
  end

  def set_type
    if type.eql?('english')
      __setobj__(EnglishCompetency.new(selection_params))
    elsif type.eql?('qualification')
      __setobj__(Qualification.new(selection_params))
    elsif type.eql?('experience')
      __setobj__(Experience.new(selection_params))
    elsif type.eql?('preferance')
      __setobj__(CategoryPreferance.new)
    end
  end
end