class UsersController < ApplicationController
	
  def index
  end

  def create
  end

  def new
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
      flash[:notice] = "ユーザー情報を変更できませんでした"
      render "users/edit"
    end
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduce, :email, :password, :password_confirmation, :deleted_at, :accepted)
  end
end
