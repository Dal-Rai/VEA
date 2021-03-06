class FocalContact < ApplicationRecord
  validates_presence_of :firstname, :email, :phone_number

  belongs_to :university, inverse_of: :focal_contact

  def name
    name = []
    name << firstname
    name << middlename
    name << lastname
    name.join(" ")
  end

end
