class ApplicationProgress < ApplicationRecord
  include ApplicationProgressState

  belongs_to :user, inverse_of: :application_progresses
  belongs_to :course, inverse_of: :application_progresses
  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments, allow_destroy: true
end