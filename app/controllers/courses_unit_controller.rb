class CoursesUnitController < ApplicationController

  def create
    @course_unit = CourseUnit.new(course_unit_params)

    if @course_unit.save
      redirect_to course_units_course_unit_index_path(course_id: @course_unit.course_id, login_aei: search_param)
    else
      render json: {error: {message: 'Error creating Unit'}, success: false}, status: :unprocessable_entity
    end
  end

  def destroy
    @course_unit = CourseUnit.find(params[:id])
    if @course_unit.destroy
      redirect_to course_units_course_unit_index_path(course_id: @course_unit.course_id, login_aei: params[:login_aei])
    else
      render json: {error: {message: 'Error Deleting Faculty'}, success: false}, status: :unprocessable_entity
    end

  end

  private

  def course_unit_params
    params.require(:course_unit).permit(:course_id, :unit_id)
  end

  def search_param
    params[:course_unit][:login_aei]
  end

end
