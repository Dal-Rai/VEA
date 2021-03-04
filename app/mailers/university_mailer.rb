class UniversityMailer < ApplicationMailer

  def notify_portal_admin uni
    @uni = uni
    @focal_contact = uni.focal_contact
    mail(to: @focal_contact.email, subject: 'New university notified', uni: @uni)
  end


end