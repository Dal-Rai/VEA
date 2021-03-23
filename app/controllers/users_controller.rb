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

  end
end