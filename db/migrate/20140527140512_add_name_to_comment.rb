class AddNameToComment < ActiveRecord::Migration
  def change

    change_table :comments do |t|
      t.string :name
    end

  end
end
