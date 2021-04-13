module WeightageCalculator
  extend ActiveSupport::Concern

  def english_weightage
    highest_english_competency.nil? ? 0 : highest_english_competency.overall_band
  end

  def qualification_weightage
    highest_qualification.nil? ? 0 : highest_qualification.overall_percentage
  end

  def calc_english_weightage(university)
    english_rule = university.criteria_rules.english.first
    if english_rule.nil?
      english_weightage
    else
      english_weightage * english_rule.weightage
    end
  end

  def calc_academic_weightage(university)
    academic_rule = university.criteria_rules.academic.first
    if academic_rule.nil?
      qualification_weightage
    else
      qualification_weightage * academic_rule.weightage
    end
  end

  def calc_experience_weightage(university)
    experience_rule = university.experience_criteria
    return 0 unless experience_rule.nil? || experience_rule.persisted?
    related_experience = experiences.where(related: true).sum(&:total_experience)
    unrelated_experience = experiences.where(related: false).sum(&:total_experience)
    related_experience * experience_rule.related_experience + unrelated_experience*experience_rule.unrelated_experience
  end

  def calc_country_weightage(university)
    country_rule = university.country_criterias.find_by('country ILIKE ?', "#{country}")
    country_rule.nil? ? 0 : country_rule.weightage
  end

  def calc_weightage(university)
    self.total_weightage = calc_english_weightage(university) + calc_academic_weightage(university) +
      calc_experience_weightage(university) + calc_country_weightage(university)
  end

end
