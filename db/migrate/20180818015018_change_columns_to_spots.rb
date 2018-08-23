class ChangeColumnsToSpots < ActiveRecord::Migration[5.2]


  # 変更内容
  def up
    change_column :spots, :spot_pros, :text, null: true
    change_column :spots, :spot_cons, :text, null: true
    add_column :spots, :transportation_text, :text
    add_column :spots, :tourism_level_text, :text
    remove_column :spots, :spot_image_id, :json
  end

  # 変更前の状態
  def down
  	change_column :spots, :spot_pros, :text, null: false
    change_column :spots, :spot_cons, :text, null: false
    add_column :spots, :spot_image_id, :json, null: false
  end
end
