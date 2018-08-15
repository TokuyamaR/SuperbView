class CreateSpotImages < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_images do |t|
      t.string :spot_image
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
