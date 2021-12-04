class UsersController < ApplicationController

  # ログインしていない人のアクセスを制限する。ただしindexは除く
  before_action :authenticate_user!, except: [:index]

  def show
  end
  
  def edit
    # ログインしている人
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

   private
   def user_params
    params.require(:user).permit(:name, :email)
   end
end
