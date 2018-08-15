class SpotsController < ApplicationController

  def top
  end

  def index
    @spots = Spot.search(params[:search]).page(params[:page]).reverse_order
    if @spots.count == 0
        flash[:notice] = "該当する店舗はありません"
        redirect_to root_path
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @like_comments = LikeComment.where(params[:id])
  end

  def new
    @spot = Spot.new
    3.times { @spot.spot_images.build }
  end

  def create
    @spot = Spot.create(spot_params)
    if @spot.save
      flash[:notice] = "投稿が完了しました"
      redirect_to root_path  # spot_showページができていないので仮のパス
    else
      flash[:notice] = "投稿内容にエラーがあります"
      render "spots/new"
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    3.times { @spot.spot_images.build }
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:notice] = "更新が完了しました"
      redirect_to root_path
    else
      flash[:notice] = "更新内容にエラーがあります"
      render "spots/edit"
    end
  end

  # 管理者側のみ実装
  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    redirect_to root_path
  end

  private

   def spot_params
     params.require(:spot).permit(:spot_name, :spot_introduce, :spot_pros, :spot_cons, :country, :address,
                                  :transportation, :tourism_level,:good_season_start, :good_season_end, :user_id,
                                  spot_images_attributes: [:id, :spot_image, :image_cache])
   end

end
