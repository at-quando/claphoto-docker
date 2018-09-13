class MessagesController < ApplicationController
  def create
    @message = Message.new(messages_params)
      if @message.save
        redirect_to home_index_path, notice: 'Send message Successful.'
      else
        redirect_to home_index_path, notice: 'Send message Failed.'
      end
  end

  def messages_params
    params.require(:message).permit(:name, :email, :message)
  end
end
