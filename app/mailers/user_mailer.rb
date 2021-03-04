class UserMailer < ApplicationMailer
  def invitation_instructions(user, token, opts = {})
    @user = user
    mail(to: user.email)
  end

  def reset_password_instructions(user, token, _args)
    @user = user
    @token = token
    @user_name = user.full_name

    mail(
      to: @user.email,
      template_name: 'send_reset_password_instructions'
    )
  end

  def notify_activation(user)
    @user = user
    mail(to: @user.email)
  end
end
