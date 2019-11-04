class UsersController < ApplicationController
  def new
    if logged_in?
      redirect_to tasks_path, notice: '既にログイン済です'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to tasks_path(@user.id)
      else
        render 'new'
      end
  end

  def show
    @user = User.find(params[:id])
    # @tasks = Task.where(user_id: @user.id)
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

