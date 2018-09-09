class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :authenticate_administrator!, only: [:admin_index, :admin_show, :admin_edit, :admin_update, :admin_destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  # 昇順、降順で並び替えするためのヘルパーメソッド
  helper_method :sort_column, :sort_direction

  def index #今回は使用せず
  end

  def create #今回は使用せず
  end

  def new #今回は使用せず
  end

  def show_likes
    @user = User.find(current_user.id)
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(5) # ユーザーがいいねしたスポットだけを抽出する
  end

  def show_comments
    @user = User.find(params[:id])
    @like_comments = LikeComment.where(user_id: @user.id).page(params[:page]).per(5) # ユーザーの口コミ一覧を抽出する
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "ユーザー情報を変更しました"
    redirect_to user_show_likes_path(@user.id)
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
    @users = User.all.page(params[:page]).order(sort_column + ' ' + sort_direction).per(20)
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

  def admin_edit 
    @user = User.find(params[:id])
  end 

  def admin_update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "ユーザー情報を変更しました"
    redirect_to admin_update_user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduce, :email, :user_image, :password, :password_confirmation, :current_password, :deleted_at, :accepted)
  end

  def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def ensure_correct_user
    if administrator_signed_in?
    elsif user_signed_in?
      @user = User.find_by(id: params[:id])
      if  @user.id != current_user.id
        redirect_to root_path
        flash[:alert] = "権限がありません"
      end
    else
      redirect_to root_path
      flash[:alert] = "権限がありません"
    end
  end
end
