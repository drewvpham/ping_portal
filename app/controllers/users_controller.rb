class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :delete]
  before_action :user_authorized, only: [:show]
  before_action :user_logged_in, only: [:new]
def index
  @messages = Message.where(recipient_id = session[:user_id])
end

def create
  @user= User.create(user_params)
  if @user.valid?
    session[:user_id]=@user.id
    redirect_to users_path
  else
    flash[:errors]= @user.errors.full_messages
    redirect_to :back
  end
end

def edit
end

def update
  @user.update(user_params)
  redirect_to events_path
end

def show
  @messages=Message.find_by(user_id: session[:user_id])
  @users=User.all
end

private
  def user_params
    params.require(:user).permit( :username, :email, :password, :password_confirmation)
  end

  def set_user
      @user=User.find(session[:user_id])
  end
end
