class StudentController < ApplicationController

  def create
    @user = User.new(stud_params)
    @user.user_type = :student
    @user.password = 'Selise88'

    if @user.save
      redirect_to(controller: :home, action: :index)
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

  def update
    @user = User.find(params[:id])
    if @user.update(stud_params)
      redirect_to(controller: :users, action: :show, id: @user.id)
    else
      render json: {error: {message: 'Error creating Student'}, success: false}, status: :unprocessable_entity
    end
  end

  private

  def stud_params
    params.require(:user).permit(:id, :email, :password,
      profile_attributes: [:id, :salutation, :firstname, :middlename, :lastname, :mobile_no, :gender, :passport_no,
        :avatar],
      address_attributes: [:id, :street_no, :street_name, :suburb, :post_code, :city, :country],
      english_competencies_attributes: [:id, :overall_band, :expiry, :competency_type, :speaking, :listening, :writing,
        :reading],
      qualifications_attributes: [:id, :highest_qualification, :course, :overall_percentage, :completed_year, subject:
      %i|name
      score|],
      experiences_attributes: [:id, :job_type, :start, :end, :company, :responsibility]
    )
  end

end
