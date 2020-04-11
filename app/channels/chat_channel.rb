class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	chat = Chat.create!(content: data['content'],
  						          user_id: current_user.id,
  						          room_id: data['room_id'])
  	# ApplicationController.render_with_signed_in_user(user,partial: 'chats/chat',
   #                                                          locals: {chat: chat})
  	ActionCable.server.broadcast 'chat_channel', chat #, content: render_message,
  												# room_id: params['room_id']
  end
end
