class UnitController < ApplicationController

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to(action: :course_units, params: {course_id: course_id})
    else
      render json: {error: {message: 'Error creating Unit'}, success: false}, status: :unprocessable_entity
    end
  end

  def show
    @course = Course.find(course_id)
    @unit = Unit.find(params[:id])
  end


  def new
    @unit = Unit.new
    @course = Course.find(course_id)
    @units = Unit.all
  end

  def search
    @units = Unit.where("code ILIKE ?", "%#{params[:search]}%")
    render json: {name: 'dal'}
  end

  def course_units
    @course = Course.find(course_id)
    @course_units = @course.course_units
    @units = Unit.where("code ILIKE ?", "%#{params[:login_aei]}%") if params[:login_aei].present?
  end

  def update
    @unit = Unit.find(params[:id])
    if @unit.update(unit_params)
      redirect_to course_units_course_unit_index_path(course_id: course_id)
    else
      render json: {error: {message: 'Error Updating Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    if @unit.destroy
      redirect_to course_units_course_unit_index_path(course_id: course_id)
    else
      render json: {error: {message: 'Error Deleting Faculty'}, success: false}, status: :unprocessable_entity
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :code, :credit_point, :level).merge!(level: params[:level])
  end

  def course_id
    params[:course_id]
  end

end
