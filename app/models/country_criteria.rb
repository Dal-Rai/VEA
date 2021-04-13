class CountryCriteria < ApplicationRecord
  belongs_to :university, inverse_of: :country_criterias
end