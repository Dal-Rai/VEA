class ApplicationDecorator < Draper::Decorator
  include Draper::LazyHelpers

  def format_date(date)
    date&.strftime(CONSTANTS['date_format'])
  end
end
