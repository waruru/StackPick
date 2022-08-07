class AddColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :published, :boolean, null: false, default: false, after: :description
  end
end
