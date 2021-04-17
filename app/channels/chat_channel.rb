class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create(
      message: data['message'][0],
      user_id: data['message'][1],
      chatable_id: data['message'][2],
      chatable_type: 'Course'
    )
  end
end
