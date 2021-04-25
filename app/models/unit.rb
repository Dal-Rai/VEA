require 'elasticsearch/model'
class Unit < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :name, :code, :credit_point, :level
  has_many :course_units, inverse_of: :unit, dependent: :destroy
  belongs_to :university, inverse_of: :units

  enum level: {high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4}

  settings do
    mappings dynamic: false do
      indexes :code, type: :text
      indexes :name, type: :text
    end
  end

  def search_detail
    "#{code}  #{name} is offered in #{course_units.first.course.faculty.university.name}"
  end

  def code_name
    "#{code} #{name}"
  end
end