class FocalContact < ApplicationRecord
  validates_presence_of :name, :email, :phone_number

  belongs_to :university, inverse_of: :focal_contact

end
