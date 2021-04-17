class Chat < ApplicationRecord
  belongs_to :user, inverse_of: :chats
  belongs_to(
    :chatable,
    polymorphic: true
  )

  after_create_commit :broadcast_message

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end

end