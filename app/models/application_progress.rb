class ApplicationProgress < ApplicationRecord
  include ApplicationProgressState
  validate :uniq_application, on: :create

  belongs_to :user, inverse_of: :application_progresses
  belongs_to :course, inverse_of: :application_progresses
  has_many :attachments, as: :attachable
  has_many :chats, as: :chatable

  accepts_nested_attributes_for :attachments, allow_destroy: true

  def uniq_application
    errors.add(:application_progress, 'You have already applied to this course') if applied?
  end

  def applied?
    ApplicationProgress
      .where(user_id: self.user_id, course_id: self.course_id, state: [1,2,3,4]).present?
  end

  def total_session_months
    course.semester? ? course.duration*6 : course.duration*3
  end
end