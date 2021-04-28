class ApplicationProgressController < ApplicationController

  def create
    @application = ApplicationProgress.new(progress_params)
    form = ApplicationProgressForm.new(@application, attachment_params)

    if form.save
      flash[:success] = 'Applied successfully'
    else
      flash[:danger] = 'Application failed'
    end
    redirect_to(controller: :student, action: :application, id: current_user.id)
  end

  def show
    @application = ApplicationProgress.find_by(id: params[:id])
  end

  def update
    @application = ApplicationProgress.find_by(id: params[:id])
    if attachment_params[:attachables_attributes][:file].present?
      attachment = application.attachments.find_by(name: attachment_params[:attachables_attributes][:name])
      attachment.update(file: attachment_params[:attachables_attributes][:file])
    end

    render :show
  end

  def transition
    if application.event(current_user, transition_params)
      unless (application.enrolled? || application.completed?)
        application.attachments.new(
          file: attachment_params[:attachables_attributes][:file],
          name: attachment_params[:attachables_attributes][:name]
        ).save
      end
      render :show
    else
      invalid_resource!(application)
    end
  end

  def index
    @applications = Course.find(params[:course_id]).application_progresses
  end

  private

  def application
    @application ||= ApplicationProgress.find(params[:id])
  end

  def transition_params
    event = params.require(:application_progress).require(:event)
    params.require(:application_progress).permit(:event, ApplicationProgress.transition_params(event))
  end

  def progress_params
    params.require(:application_progress).permit(:course_id, :user_id)
  end

  def attachment_params
    params.require(:application_progress).permit(attachables_attributes: [:file, :name])
  end

end
