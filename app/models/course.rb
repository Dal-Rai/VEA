require 'elasticsearch/model'
class Course < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :name, :code, :duration, :rank
  belongs_to :faculty, inverse_of: :courses
  belongs_to :course_category, inverse_of: :courses
  has_many :course_units, inverse_of: :course
  has_many :units, through: :course_units
  has_many :application_progresses, inverse_of: :course
  has_many :english_competencies, as: :competenciable, dependent: :destroy
  has_many :academic_eligibilities, as: :eligiable, dependent: :destroy
  has_many :subjects, as: :subjectable, class_name: 'Subject'
  accepts_nested_attributes_for :english_competencies, allow_destroy: true
  accepts_nested_attributes_for :academic_eligibilities, allow_destroy: true

  enum rank: {high_school: 0, diploma: 1, graduate: 2, post_graduate: 3, phd: 4}

  settings do
    mappings dynamic: false do
      indexes :code, type: :text
      indexes :name, type: :text
    end
  end

  def search_detail
    "#{code}  #{name} is offered in #{faculty.university.name}"
  end

  def as_indexed_json(options={})
    self.as_json(
      include: {
        units:  { methods: [:code_name], only: [:code_name] }
      })
  end

  def english_competencies
    super.present? ? super : super.build(competency_attributes)
  end

  def academic_eligibilities
    super.present? ? super : super.build(academic_attributes)
  end

  def competency_attributes
    faculty.university.english_competencies.map {|eng|
      {
        overall_band: eng.overall_band,
        competency_type: eng.competency_type,
        speaking: eng.speaking,
        listening: eng.listening,
        writing: eng.writing,
        reading: eng.writing
      }
    }
  end

  def academic_attributes
    faculty.university.academic_eligibilities.map {|aca|
      {code: aca.code, eligibility_type: aca.eligibility_type, minimum_score: aca.minimum_score}
    }
  end

end