class LikeCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :authenticate_administrator!, only: [:admin_index, :admin_show, :admin_edit, :admin_destroy]


  def index
    @spot = Spot.find(params[:spot_id])
    @like_comments = LikeComment.where(spot_id: @spot.id).page(params[:page])
  end

  def new
    @user = User.find(current_user.id)
    @like_comment = LikeComment.new()
    @spot = Spot.find(params[:spot_id])
  end

  def create
    @user = User.find(current_user.id)
    @spot = Spot.find(params[:spot_id])
    @like_comment = LikeComment.create(like_comment_params)
    @like_comment.spot_id = @spot.id
    @like_comment.user_id = @user.id

    if @like_comment.save
      flash[:notice] = "口コミを投稿しました"
      redirect_to spot_like_comments_path(@like_comment.spot_id)
    else
      flash[:alert] = "口コミを投稿できませんでした"
      render "like_comments/new"
    end
  end

  def edit
    @user = User.find(current_user.id)
    @spot = Spot.find(params[:spot_id])
    @like_comment = LikeComment.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @spot = Spot.find(params[:spot_id])
    @like_comment = LikeComment.find(params[:id])
    @like_comment.spot_id = @spot.id
    @like_comment.user_id = @user.id
    if @like_comment.update(like_comment_params)
      flash[:notice] = "口コミを編集しました"
      redirect_to spot_like_comments_path(@like_comment.spot_id)
    else
      flash[:alert] = "口コミを編集できませんでした"
      render "like_comments/edit"
    end
  end

  def show #今回は口コミ内容が短いため作成せず
  end

  def destroy
    user = User.find(current_user.id)
    spot = Spot.find(params[:spot_id])
    like_comment = LikeComment.find_by(id: params[:id])
    like_comment.spot_id = spot.id
    like_comment.user_id = user.id
    like_comment.destroy

    flash[:notice] = "口コミを削除しました"
    redirect_to spot_like_comments_path(like_comment.spot_id)
  end

  # 管理者用アクション
  def admin_index
    @like_comments = LikeComment.all
  end

  def admin_show
    @like_comment = LikeComment.find(params[:id])
  end

  def admin_destroy
    @like_comment = LikeComment.find(params[:id])
    @like_comment.delete
    flash[:notice] = "口コミを削除しました"
    redirect_to admin_like_comments_path
  end

  private

   def like_comment_params
     params.require(:like_comment).permit(:title, :text, :spot_id, :user_id)
   end
end
