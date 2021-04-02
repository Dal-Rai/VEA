class PaypalCart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :wallet
  scope :fresh, -> { where(created_at: Time.now.yesterday..Time.now ) }
end
