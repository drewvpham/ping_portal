class MessagesController < ApplicationController


  def new
    @message = Message.new
    @recipient = User.find(params[:user_id])
  end

  def create
    @message = Message.new(message_params.merge(user_id: current_user.id, recipient_id: params[:id]))
    if @message.save
      flash[:success] = "Your message has been sent!"
      redirect_to users_path
    else
      flash[:failure] = "Please try again."
      redirect_to users_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :recipient_id)
  end
end
