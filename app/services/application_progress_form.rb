class ApplicationProgressForm < SimpleDelegator
  attr_accessor(
    :application_params
  )

  def initialize(application, params)
    __setobj__(application)
    @application_params = params
  end

  def save
    self.attachments.new(name: 'Marksheet', file: application_params[:application_progress][:attachables_attributes][:file])
    super
  end
end