class Address < ApplicationRecord
  extend ActiveSupport::Concern

  belongs_to(
    :addressable,
    polymorphic: true,
    optional: true
  )

end