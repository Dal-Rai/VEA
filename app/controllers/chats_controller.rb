class ChatsController < ApplicationController
  def index
    @application = ApplicationProgress.find_by(id: params[:application_id])
    @messages = @application.chats
  end

  def application
    if current_user.student?
      @applications = ApplicationProgress.joins(:chats).where('application_progresses.user_id =? ', current_user.id)
                        .uniq
    elsif current_user.uni_admin?
      application_ids = ApplicationProgress.joins(course: :faculty).where('faculties.university_id = ?',
        current_user.university_id).pluck(:id)
      @applications = ApplicationProgress.joins(:chats).where(id: application_ids).uniq
    end
  end
end
