class ApplicationMailer < ActionMailer::Base
  default from: 'info@vea.bt'
  layout 'mailer'
  default to: 'info@vea.bt'
end
