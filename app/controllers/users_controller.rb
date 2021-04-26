class UsersController < ApplicationController
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  private
  def user_params
    params.require(:user).permit(:name,:introduction)
  end
end
