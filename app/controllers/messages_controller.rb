class MessagesController < ApplicationController

  def index
    @all_messages=Message.all.includes(:user, :recipient)
    @private_messages=Message.where(user: current_user, private: true).includes(:user, :recipient).or(Message.where(recipient: current_user, private: true).includes(:user, :recipient))
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
      redirect_to :back
    else
      flash[:failure] = "Please try again."
      redirect_to :back
    end
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :recipient_id, :private)
  end
end
