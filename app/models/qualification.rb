class Qualification < ApplicationRecord
  validates_presence_of :overall_percentage
  belongs_to :user, inverse_of: :qualifications
  has_many :subjects, as: :subjectable, class_name: 'Subject'
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true

  enum level: {high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4}
  default_scope -> { order(level: :desc) }
end