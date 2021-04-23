class ApplicationProgressForm < SimpleDelegator
  attr_accessor(
    :application_params
  )

  def initialize(application, params)
    __setobj__(application)
    @application_params = params
  end

  def save
    self.attachments.new(file: application_params[:attachables_attributes][:file], name:
      application_params[:attachables_attributes][:name])
    super
  end
end