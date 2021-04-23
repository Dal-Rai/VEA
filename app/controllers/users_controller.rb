class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i|show students universities|

  def show
    if  current_user.portal_admin?
      @universities = University.all
      @students = User.student.all
    elsif current_user.student?
      current_user.english_competencies.build if current_user.english_competencies.empty?
      current_user.qualifications.build if current_user.qualifications.empty?
      current_user.build_wallet if current_user.wallet.nil?
      current_user.build_address if current_user.address.nil?
    else
      @university = current_user.university
    end
  end

  def students
    @users = User.student.map{|u| u.calc_weightage(current_user.university)}
  end

  def universities
    @universities = University.all
  end

  def student_details
    @student = User.find_by(id: params[:student_id])
  end

  def search
    @results = {
      universities: University.search(params["term"]),
      courses: Course.search(params["term"]),
      units: Unit.search(params["term"])
    }
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User details updated successfully"
    else
      flash[:error] = @user.errors.messages
    end
  end

  def invite
    User.new(user_params).save
    flash[:success] = 'User invited successfully'

  end

  private

  def user_params
    params
      .require(:user)
      .permit(:email, :password, profile_attributes:[:firstname, :middlename, :lastname, :mobile_no])
  end
end