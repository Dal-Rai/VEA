class ChatsController < ApplicationController
  def index
    @application = ApplicationProgress.find_by(id: params[:application_id])
    @messages = @application.chats
  end

  def application
    if current_user.student?
      @applications = ApplicationProgress.joins(:chats).where('application_progresses.user_id =? ', current_user.id)
                        .order('chats.created_at desc')
    elsif current_user.uni_admin?
      application_ids = ApplicationProgress.joins(course: :faculty).where('faculties.university_id = ?',
        current_user.university_id).pluck(:id)
      @applications = ApplicationProgress.joins(:chats).where(id: application_ids).order('chats.created_at desc')
    end
  end
end
