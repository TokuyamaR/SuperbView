class LikeCommentsController < ApplicationController

  def index
    @like_comments = LikeComment.where(params[:spot_id])
  end

  def new
    @like_comment = LikeComment.new()
  end

  def create #spot_idは不要かわからないため、エラーが出たら@spotを作成
    @like_comment = LikeComment.create(like_comment_params)
    if @like_comment.save
      flash[:notice] = "口コミを投稿しました"
      redirect_to spot_like_comments_path
    else
      flash[:notice] = "口コミを投稿できませんでした"
      render "like_comments/new"
    end
  end

  def edit
    @like_comment = LikeComment.find(params[:id])
  end

  def update #spot_idは不要かわからないため、エラーが出たら@spotを作成
    @like_comment = LikeComment.find(params[:id])
    if @like_comment.update
      flash[:notice] = "口コミを編集しました"
      redirect_to spot_like_comments_path
    else
      flash[:notice] = "口コミを編集できませんでした"
      render "like_comments/edit"
    end
  end

  def show #今回は口コミ内容が短いため作成せず
  end

  def destroy
    like_comment = LikeComment.find(params[:id])
    like_comment.destroy

    redirect_to spot_like_comments_path
  end

  private

   def like_comment_params
     params.require(:like_comment).permit(:title, :text)
   end
end
