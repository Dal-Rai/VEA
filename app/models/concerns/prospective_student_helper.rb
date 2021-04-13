module ProspectiveStudentHelper
  extend ActiveSupport::Concern

  def highest_qualification_score
    highest_qualification.nil? ? 0 : highest_qualification.overall_percentage
  end

  def highest_qualification_name
    return if highest_qualification.nil?
    CONSTANTS[highest_qualification.level+'_text']+"("+ String(highest_qualification_score)+")"
  end

  def highest_english_competency_score
    highest_english_competency.nil? ? 0: highest_english_competency.overall_band
  end

  def highest_english_competency_name
    return if highest_english_competency.nil?
    highest_english_competency.competency_type+"("+ String(highest_english_competency_score)+")"
  end

  def total_experience
    experiences.sum(&:total_experience)
  end


end
