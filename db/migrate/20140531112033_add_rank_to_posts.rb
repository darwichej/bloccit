class AddRankToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rank, :float, :avatar
  end
end
