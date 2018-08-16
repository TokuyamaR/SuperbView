class UsersController < ApplicationController
	
  def index #今回は使用せず
  end

  def create #今回は使用せず
  end

  def new #今回は使用せず
  end

  def show_likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    @spots = Spot.where(id: @likes.spot_id)
  end

  def show_comments
    @user = User.find(params[:id])
    @like_comments = LikeComment.where(user_id: @user.id)
    @spots = Spot.where(id: @like_comments.spot_id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to user_show_likes_path
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
    params.require(:user).permit(:name, :introduce, :email, :password, :password_confirmation, :deleted_at, :accepted)
  end
end
