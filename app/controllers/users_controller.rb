class UsersController < ApplicationController
  
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
end
