class UsersController < ApplicationController
  
  def new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "You have signed up!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = "Sorry there was an error."
      redirect_to '/signup'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
