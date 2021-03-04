class PremiumPayment < ApplicationRecord
  belongs_to(
    :payable,
    polymorphic: true
  )

end
