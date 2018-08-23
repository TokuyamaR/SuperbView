class ChangeColumnToSpotImages < ActiveRecord::Migration[5.2]

  def change
  	rename_column :spot_images, :spot_image, :image_id
  end
end
