class FacultyController < ApplicationController
  before_action :authenticate_user!, only: %i|update destroy index rating|
  before_action :university

  def create
    @faculty = Faculty.new(faculty_params)
    @faculty.university_id = params[:university_id]


    if @faculty.save
      redirect_to(action: :index)
    else
      render json: {error: {message: 'Error creating Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_params)
      redirect_to(action: :index)
    else
      render json: {error: {message: 'Error creating Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  def index
    @user = User.uni_admin.first
    @faculties = @university.faculties
  end


  def new
    @faculty = Faculty.new
  end

  def search
    @faculty = Faculty.find_by(code: params[:search])
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    if @faculty.destroy
        redirect_to(action: :index)
    else
      render json: {error: {message: 'Error Deleting Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  private

  def faculty_params
    params.require(:faculty).permit(:name, :code)
  end

  def university
    @university = University.find(params[:university_id])
  end

end
