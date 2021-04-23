class RecommendationModel < Eps::Base
  def build
    courses = Course.all

    # train
    data = courses.map { |v| features(v) }
    model = Eps::Model.new(data, target: :total_fees)
    puts model.summary

    # save to file
    File.write(model_file, model.to_pmml)

    # ensure reloads from file
    @model = nil
  end

  def predict(course)
    model.predict(features(course))
  end

  private

  def features(course)
    {
      units: course.units.count,
      rank: course.rank,
      duration: course.duration,
      name: course.name,
      total_fees: course.total_fees
    }
  end

  def model
    @model ||= Eps::Model.load_pmml(File.read(model_file))
  end

  def model_file
    File.join(__dir__, "price_model.pmml")
  end
end