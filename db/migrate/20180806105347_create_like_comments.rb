class CreateLikeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :like_comments do |t|
      t.string :title, null: false
      t.string :text, null: false
      t.integer :user_id, null: false
      t.integer :spot_id, null: false

      t.timestamps
    end
  end
end
