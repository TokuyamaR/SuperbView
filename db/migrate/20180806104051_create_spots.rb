class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :spot_name, null: false, index: true
      t.string :spot_image_id, null: false
      t.text :spot_introduce, null: false
      t.text :spot_pros, null: false
      t.text :spot_cons, null: false
      t.string :country, null: false, index: true
      t.string :address
      t.string :transportation, null: false
      t.string :tourism_level, null: false
      t.integer :good_season_start, null: false
      t.integer :good_season_end, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
