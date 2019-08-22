class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: '登録が完了しました'
    else
      render :new
    end
  end

  def edit
    if @user.id != current_user.id
      redirect_to root_path, notice: 'その操作はできません'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end


  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'アカウントを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :email, :admi, :password, :password_confirmation, :gender, :age, :occupation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
