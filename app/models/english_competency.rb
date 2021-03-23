class EnglishCompetency < ApplicationRecord
  validates_presence_of :overall_band
  belongs_to(
    :competenciable,
    polymorphic: true,
    optional: true
  )

  enum competency_type: {PTE: 0, IELTS: 1}
end