class UsersController < ApplicationController

  def index #今回は使用せず
  end

  def create #今回は使用せず
  end

  def new #今回は使用せず
  end

  def show_likes
    @user = User.find(params[:id])
    # @likes = Like.where(user_id: @user.id)
    @likes = @user.likes
    @spots = @user.spots.page(params[:page]) #仮設定のため後日質問（ユーザーがいいねしたスポットだけを抽出したい）
  end

  def show_comments
    @user = User.find(params[:id])
    @like_comments = @user.like_comments.page(params[:page])
    @spots = @user.spots.page(params[:page]) #仮設定のため後日質問（ユーザーがいいねしたスポットだけを抽出したい）
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to user_show_likes_path(@user.id)
    else
      flash[:alert] = "ユーザー情報を変更できませんでした"
      render "users/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.soft_delete
    if user_signed_in?
      sign_out(@user)
      redirect_to new_user_session_path
      flash[:notice] = "退会しました"
    else
      redirect_to root_path
      flash[:alert] = "エラーが発生しました"
    end
  end

  # 管理者用アクション
  def admin_index
    @users = User.all
  end

  def admin_show
    @user = User.find(params[:id])
  end

  def admin_destroy
    @user = User.find(params[:id])
    @user.soft_delete
    flash[:notice] = "削除されました"
    redirect_to admin_users_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduce, :email, :user_image, :password, :password_confirmation, :current_password, :deleted_at)
  end
end
