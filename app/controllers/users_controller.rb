class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i|show students universities|

  def show
    @user = User.find(params[:id])
    if  @user.portal_admin?
      @universities = University.all
      @students = User.student.all
    elsif @user.student?
      @user.english_competencies.build if @user.english_competencies.empty?
      @user.qualifications.build if @user.qualifications.empty?
    else
      @university = @user.university
    end
  end

  def students
    @users = User.student
  end

  def universities
    @universities = University.all
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

  private

  def user_params
    params
      .require(:user)
      .permit(:email, profile_attributes:[:firstname, :middlename, :lastname, :mobile_no])
  end
end