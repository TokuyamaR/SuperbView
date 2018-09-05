class AddNumcountToSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :likes_count, :integer
  end
end
