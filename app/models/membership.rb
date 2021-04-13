class Membership < ApplicationRecord
  belongs_to :package, inverse_of: :memberships
  belongs_to(
    :memberable,
    polymorphic: true
  )
end