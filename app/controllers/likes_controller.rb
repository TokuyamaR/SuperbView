class LikesController < ApplicationController
    before_action :authenticate_user!

  # 最初に設定内容

  # def create
  #   spot = Spot.find(params[:spot_id])
  #   like = current_user.likes.new(spot_id: spot.id)
  #   like.save
  #   redirect_to spot_path(spot)
  # end
  # def destroy
  #   spot = Spot.find(params[:spot_id])
  #   like = current_user.likes.find_by(spot_id: params[:spot_id])
  #   like.destroy
  #   redirect_to spot_path(spot)
  # end

  # ２度目の設定

  before_action :set_spot

  def create
    @like = Like.create(user_id: current_user.id, spot_id: params[:spot_id])
    @likes = Like.where(spot_id: params[:spot_id])
    @spot.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, spot_id: params[:spot_id])
    like.destroy
    @likes = Like.where(spot_id: params[:spot_id])
    @spot.reload
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end