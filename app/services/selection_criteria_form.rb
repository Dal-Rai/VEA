class SelectionCriteriaForm < SimpleDelegator
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
    self.competenciable = current_user.university
    self.competency_type = criteria_type
  end

  def assign_default_experience
    self.university = current_user.university
  end

  def assign_default_qualification
    self.university = current_user.university
    self.qualification_type = criteria_type
  end

  def assign_default_rule
    self.university = current_user.university
    self.criteria = criteria_type
  end

  def assign_default_country
    self.university = current_user.university
  end

  def save
    send('assign_default_'+type)
    super
  end

  def set_type
    if type.eql?('english')
      __setobj__(EnglishCompetency.new(selection_params))
    elsif type.eql?('qualification')
      __setobj__(QualificationCriteria.new(selection_params))
    elsif type.eql?('experience')
      __setobj__(ExperienceCriteria.new(selection_params))
    elsif type.eql?('rule')
      __setobj__(CriteriaRule.new(selection_params))
    elsif type.eql?('country')
      __setobj__(CountryCriteria.new(selection_params))
    end
  end
end