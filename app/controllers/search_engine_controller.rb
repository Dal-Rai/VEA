class SearchEngineController < ApplicationController

  def search_unit
    redirect_to course_units_course_unit_index_path(course_id: params[:course_id], login_aei: params[:login_aei])
  end

  def index
    @results = {
      universities: University.search(params["term"]),
      courses: Course.search(params["term"]),
      units: Unit.search(params["term"])
    }
  end

  # def search_params
  #   params.permit(:term, :duration)
  # end

  def item_detail
    @result = params[:name].classify.constantize.find(params[:id])
  end

end
