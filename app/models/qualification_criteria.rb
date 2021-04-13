class QualificationCriteria < ApplicationRecord
  belongs_to :university, inverse_of: :qualification_criterias
  enum qualification_type: {high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4}
end