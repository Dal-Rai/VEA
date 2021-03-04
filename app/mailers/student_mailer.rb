class StudentMailer < ApplicationMailer

  def notify_invitation user
    @user = user
    mail(to: @user.email, subject: 'Activate your account', user: @user)
  end


end