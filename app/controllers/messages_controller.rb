class MessagesController < ApplicationController

  def index
    @messages=Message.all
    @users=User.all
  end
  def new
    @message = Message.new
    @recipient = User.find(params[:user_id])
  end

  def create
    @message = Message.create(message_params.merge(user_id: current_user.id))
    if @message.save
      flash[:success] = "Your message has been sent!"
      redirect_to messages_path
    else
      flash[:failure] = "Please try again."
      redirect_to messages_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :recipient_id)
  end
end
