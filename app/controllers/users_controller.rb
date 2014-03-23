class UsersController < ApplicationController
  def new
    if user_signed_in?
      @user = User.new
    else
      redirect_to new_user_session_path
    end
  end

  def index
  	@users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end
  
  def delete
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      Notifications.new_user(@user).deliver
      redirect_to users_path
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :level)
  end
end
