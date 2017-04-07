class ConversationsController < ApplicationController
  before_action :authenticate_any!
  before_action :load_user


  def index
    @conversations = @user.get_conversations()
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  private

  def load_user
    @user = current_user
  end

end
