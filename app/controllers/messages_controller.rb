class MessagesController < ApplicationController

  before_action :authenticate_any!
  # before_action :confirm_member, only: [:complain]

  def complain

  end

  def create
    @message = Message.new(message_params)
    if @message.save
    redirect_to conversation_path(@message.conversation.id)
    else
      redirect_to conversations_path, notice: 'Some error occured your message was not sent'
    end
  end

  def create_cm
    tmp = get_params
    to = tmp[:recipientable_type].constantize.find(tmp[:recipientable_id])
    current_user.send_message(to, tmp[:content])
    redirect_to conversations_path
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :sender_id, :sender_type)
  end

  def get_params
    params.require(:conversation).permit(:recipientable_id, :recipientable_type, :content, :sender_id, :sender_type)
  end

end
