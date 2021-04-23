class Address < ApplicationRecord
  extend ActiveSupport::Concern

  belongs_to(
    :addressable,
    polymorphic: true,
    optional: true
  )

  def full_address
    name = []
    name << street_no
    name << street_name
    name << suburb
    name << ','
    name << post_code
    name << city
    name << ','
    name << country
    name.join(" ")
  end

end