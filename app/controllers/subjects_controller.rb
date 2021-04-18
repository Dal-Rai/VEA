class SubjectsController < ApplicationController

  def create
    Subject.create(filter_params)
  end

  def destroy
    Subject.find(params[:id]).destroy
  end

  private

  def filter_params
    params.require(:subject).permit(:qualification_id, :name, :percentage, :description, :subjectable_id, :subjectable_type)
  end
end