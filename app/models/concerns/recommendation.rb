module Recommendation
  extend ActiveSupport::Concern
  def future_level
    return 2 if [0, 1].include?(highest_qualification.level_before_type_cast)
    highest_qualification.level_before_type_cast + 1
  end
end
