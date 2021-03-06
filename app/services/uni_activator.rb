class UniActivator
  include Assigner
  attr_accessor(
    :token
  )

  def initialize(attibutes)
    assign_attributes(attibutes)
  end

  def activate?
    @uni = University.find_by(token: token)
    focal_person_to_user!
  end

  private

  def focal_person_to_user!
    focal_contact= @uni.focal_contact
    @uni.users.new(
      email: focal_contact.email,
      password: 'Selise88',
      user_type: 'uni_admin',
      profile_attributes: {
        firstname:focal_contact.firstname,
        middlename: focal_contact.middlename,
        lastname: focal_contact.lastname
      }
    ).save!

  end

end