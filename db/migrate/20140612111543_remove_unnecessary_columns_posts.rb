class RemoveUnnecessaryColumnsPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :string
    remove_column :posts, :text
    change_column :posts, :description, :text
  end
end
