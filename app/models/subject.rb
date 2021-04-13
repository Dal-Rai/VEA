class Subject < ApplicationRecord
  belongs_to(
    :subjectable,
    polymorphic: true
  )
end