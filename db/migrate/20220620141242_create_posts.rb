class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description
      t.text :url, null: false
      t.text :ogp_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
