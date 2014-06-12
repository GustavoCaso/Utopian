class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :date
      t.string :location
      t.string :string
      t.string :short_description
      t.string :text
      t.string :description
      t.string :text
      t.string :category
      t.string :string

      t.timestamps
    end
  end
end
