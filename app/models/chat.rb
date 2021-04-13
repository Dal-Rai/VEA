class Chat < ApplicationRecord
  belongs_to :user, inverse_of: :chats
  belongs_to(
    :chatable,
    polymorphic: true
  )
end