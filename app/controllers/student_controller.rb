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

  def add_english
    unless params[:destroy]
      current_user.english_competencies.new(
        competency_type:  params[:user][:english_competency][:competency_type],
        expiry: params[:user][:english_competency][:expiry],
        overall_band: params[:user][:english_competency][:overall_band],
        speaking: params[:user][:english_competency][:speaking],
        writing: params[:user][:english_competency][:writing],
        reading: params[:user][:english_competency][:reading],
        listening: params[:user][:english_competency][:listening]
      ).save
    end
  end

  def reload
    case(params[:type])
    when 'experience'
      current_user.experiences.find(params[:type_id]).destroy
    when 'qualification'
      current_user.qualifications.find(params[:type_id]).destroy
    else
      current_user.english_competencies.find(params[:type_id]).destroy
    end
  end

  def add_experience
    current_user.experiences.new(
      job_type:  params[:user][:experience][:job_type],
      start: params[:user][:experience][:start],
      end: params[:user][:experience][:end],
      company: params[:user][:experience][:company],
      responsibility: params[:user][:experience][:responsibility]
    ).save
  end

  def add_qualification
    current_user.qualifications.new(
      level:  params[:user][:qualification][:level],
      course: params[:user][:qualification][:course],
      overall_percentage: params[:user][:qualification][:overall_percentage],
      completed_year: params[:user][:qualification][:completed_year]
    ).save
  end

  private

  def stud_params
    params.require(:user).permit(:id, :email, :password,
      profile_attributes: [:id, :salutation, :firstname, :middlename, :lastname, :mobile_no, :gender, :passport_no,
        :avatar],
      address_attributes: [:id, :street_no, :street_name, :suburb, :post_code, :city, :country],
      english_competencies_attributes: [:id, :overall_band, :expiry, :competency_type, :speaking, :listening, :writing,
        :reading],
      qualifications_attributes: [:id, :level, :course, :overall_percentage, :completed_year, subject:
      %i|name
      score|],
      experiences_attributes: [:id, :job_type, :start, :end, :company, :responsibility]
    )
  end

end
