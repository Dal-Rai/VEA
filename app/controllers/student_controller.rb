class StudentController < ApplicationController

  def create
    @user = User.new(stud_params)
    @user.user_type = :student
    @user.password = 'Selise88'

    if @user.save
      render json: {message: 'Student created', success: true}, status: :ok
    else
      render json: {error: {message: 'Error creating Student'}, success: false}, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
    @profile = @user.build_profile
  end

  private

  def stud_params
    params.require(:user).permit(:email, :password,
      profile_attributes: [:salutation, :firstname, :middlename, :lastname, :mobile_no, :gender, :passport_no, :avatar],
      address_attributes: [:street_no, :street_name, :suburb, :post_code, :city, :country])
  end

end
