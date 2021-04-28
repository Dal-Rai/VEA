module Recommendation
  extend ActiveSupport::Concern
  def future_level
    return 2 if [0, 1].include?(highest_qualification.level_before_type_cast)
    highest_qualification.level_before_type_cast + 1
  end

  def non_member?
    return true if self.wallet.nil?
    return true unless self.wallet.persisted?
    self.wallet.end_date <= DateTime.current
  end

  def basic_member?
    ['basic_stud_quarterly','basic_stud_half_yearly','basic_stud_yearly'].include?(self.wallet.package)
  end

  def premium_member?
    ['premium_stud_quarterly','premium_stud_half_yearly','premium_stud_yearly'].include?(self.wallet.package)
  end
end
