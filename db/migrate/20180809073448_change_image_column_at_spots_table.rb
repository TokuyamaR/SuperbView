class ChangeImageColumnAtSpotsTable < ActiveRecord::Migration[5.2]
  def change
  	change_column :spots, :spot_image_id, :json
  end
end
