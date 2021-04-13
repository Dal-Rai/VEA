class Package < ApplicationRecord
  has_many :memberships, inverse_of: :package
  enum package_type: { basic: 0, premium: 1 }
  enum duration: { monthly: 0, quartly: 1, yearly: 3 }
  enum payee: { student: 0, university: 1 }
end