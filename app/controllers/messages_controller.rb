class MessagesController < ApplicationController

  def index
    @messages=Message.where(user: current_user).or(Message.where(recipient: current_user))
    @users=User.all
    @current_user_id = session[:user_id]
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

  def destroy
    Message.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :recipient_id)
  end
end
