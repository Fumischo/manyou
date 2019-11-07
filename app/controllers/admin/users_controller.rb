class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.includes(:tasks).all.order(created_at: :DESC)
  end


  def new
    @user = User.new
    @admin = current_user.admin if current_user
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      redirect_to admin_users_path, notice:"ユーザー#{@user.name}を登録しました。"
    else
      render 'new'
    end 
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end
    
    
  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー#{@user.name}を更新しました"
    else
      render 'edit'
    end
  end

  def destroy 
    if User.where(admin: true).count <= 1 && @user.admin?
      redirect_to admin_users_path, notice: "ユーザー#{@user.name}は削除することができません"
    else
      @user.destroy
      redirect_to admin_users_path, notice: "ユーザー#{@user.name}を削除しました"
    end
  end

  def confer_admin
    @user = User.find(params[:id])
    if @user.admin == false
      @user.admin = true
      @user.save
      flash[:notice] = '管理者権限を得ました'
      redirect_to admin_users_path
    elsif @user.admin == true && @user.id == current_user.id
      @user.admin = false
      @user.save
      flash[:notice] = '管理者権限を失効しました'
      redirect_to tasks_path
    else
      @user.admin = false
      @user.save
      flash[:notice] = '管理者権限がありません'
      redirect_to admin_users_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def if_not_admin
    if current_user == nil
      redirect_to new_session_path
    elsif current_user.admin?
      redirect_to tasks_path
    end
  end
end
