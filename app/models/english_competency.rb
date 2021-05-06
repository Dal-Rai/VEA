class EnglishCompetency < ApplicationRecord
  validates_presence_of :overall_band
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true
  belongs_to(
    :competenciable,
    polymorphic: true,
    optional: true
  )
  scope :active, -> { where('expiry >= ?', DateTime.now) }
  enum competency_type: {PTE: 0, IELTS: 1}
  default_scope -> { order(overall_band: :desc) }
end