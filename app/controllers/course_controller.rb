class CourseController < ApplicationController

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to(action: :index, params: {faculty_id: params[:course][:faculty_id]})
    else
      render json: {error: {message: 'Error creating Course'}, success: false}, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to(action: :index, params: {faculty_id: @course.faculty_id})
    else
      render json: {error: {message: 'Error Updating Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  def new
    @faculty = find_faculty
    @course = Course.new(faculty_id: @faculty.id)
  end

  def search
    @course = Course.find_by(code: params[:search])
  end

  def index
    @faculty = find_faculty
    @courses = @faculty.courses
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to(action: :index, params: {faculty_id: @course.faculty_id})
    else
      render json: {error: {message: 'Error Deleting Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  private

  def find_faculty
    Faculty.find(params[:faculty_id])
  end

  def course_params
    params.require(:course).permit(:name, :code, :duration, :rank, :faculty_id,
      english_competencies_attributes: [:id, :overall_band, :expiry, :competency_type, :speaking, :listening, :writing,
        :reading],
      academic_eligibilities_attributes: [:id, :code, :eligibility_type, :minimum_score])
  end

end
