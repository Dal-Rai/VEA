class ApplicationProgressDecorator < ApplicationDecorator
  delegate_all

  def current_value
    value = self.rejected? ? 100 : self.state_before_type_cast * 20
    "#{value}"
  end

  def progress_bar
    self.rejected? ? 'progress-bar-danger' : 'progress-bar-success'
  end
end
