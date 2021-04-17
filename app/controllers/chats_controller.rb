class ChatsController < ApplicationController
  def index
    @course = Course.first
    @messages = Chat.order(created_at: :asc)
  end
end
