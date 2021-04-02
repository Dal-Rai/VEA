class Wallet < ApplicationRecord
  has_many :paypal_carts

  belongs_to(
    :payee,
    polymorphic: true,
    optional: true
  )
end
