module CourseLooker
  extend ActiveSupport::Concern

    def future_qualification
      return "" unless self.student?
      return "" if highest_qualification.phd?
      return "under graduate" if highest_qualification.high_school? || highest_qualification.diploma?
      Qualification.levels.key(current_qualification_code + 1)
    end

  def current_qualification_code
    highest_qualification.level_before_type_cast
  end
end
