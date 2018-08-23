class SpotsController < ApplicationController

  def top
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def index
    @user = User.find(current_user.id)
    @spots = Spot.search(params[:search]).page(params[:page]).reverse_order
    respond_to do |f|
      f.html
      f.json { render json: @spots }
    end
    if @spots.count == 0
        flash[:notice] = "該当するスポットはありません"
        redirect_to root_path
    end
  end

  def show
    @user = User.find(current_user.id)
    @spot = Spot.find(params[:id])
    @spot_images = @spot.spot_images
    @like_comments = LikeComment.where(spot_id: @spot.id)
  end

  def new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @spot = Spot.new
    @spot.spot_images.build
  end

  def create
    @user = User.find(current_user.id)
    @spot = Spot.new(spot_params)
    @like_comments = @spot.like_comments
    @spot.user_id = current_user.id
    @spot.save

    redirect_to spot_path(@spot.id)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.delete
    flash[:notice] = "スポットを削除しました"
    redirect_to root_path
  end

  def edit
    @user = User.find(current_user.id)
    @spot = Spot.find(params[:id])
    @spot_images = @spot.spot_images
  end

  def update
    @user = User.find(current_user.id)
    @spot = Spot.find(params[:id])
    @like_comments = @spot.like_comments
    @spot.user_id = current_user.id
    if @spot.update(spot_params)
      flash[:notice] = "更新が完了しました"
      redirect_to spot_path(@spot.id)
    else
      flash[:alert] = "更新内容にエラーがあります"
      render "spots/edit"
    end
  end

  # 管理者用アクション
  def admin_index
    @spots = Spot.all
  end

  def admin_show
    @spot = Spot.find(params[:id])
  end

  def admin_edit
    @spot = Spot.find(params[:id])
    3.times { @spot.spot_images.build }
  end

  def admin_update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:notice] = "更新が完了しました"
      redirect_to admin_show_spot_path
    else
      flash[:alert] = "更新内容にエラーがあります"
      render "spots/admin_edit"
    end
  end

  def admin_destroy
    @spot = Spot.find(params[:id])
    @spot.delete
    flash[:notice] = "スポットを削除しました"
    redirect_to admin_spots_path
  end

  private

   def spot_params
     params.require(:spot).permit(:spot_name, :spot_introduce, :spot_pros, :spot_cons, :country, :latitude, :longitude, :address,
                                  :transportation,:transportation_text, :tourism_level, :tourism_level_text, :good_season_start, :good_season_end, :user_id,
                                  spot_images_attributes: [:id, :image, :spot_id, :_destroy])
   end

end
