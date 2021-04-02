module CommonHelpers
  def invalid_resource!(resource)
    @resource = resource
    Rollbar.error('Failed at Invalid subject', resource.errors.try(:messages))
    render 'api/errors/invalid_resource', status: :unprocessable_entity
  end

  def argument_error! error
    @error = error
    render 'api/errors/argument_error', status: 400
  end
end
