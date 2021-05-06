class SearchEngineController < ApplicationController
  require 'will_paginate/array'

  def search_unit
    redirect_to course_units_course_unit_index_path(course_id: params[:course_id], login_aei: params[:login_aei])
  end

  def index
    results = Course.where('name ILIKE ?', "%#{params['term']}%")
    @results = results.paginate(page: params[:page], per_page: 10)


    results = []
    # @universities = University.search(params["term"]).records.records
    # @courses = Course.search(params["term"]).records.records
    # @units = Unit.search(params["term"]).records.records
    # results.push(@universities).push(@courses).push(@units)

    # @results = single_array(results).paginate(page: params[:page], per_page: 100)
  end

  def item_detail
    @result = params[:name].classify.constantize.find(params[:id])
  end

  def single_array(results)
    records = []
    results.each do |inner_results|
      inner_results.each do |result|
        records.push(result)
      end
    end

    records
  end

end
