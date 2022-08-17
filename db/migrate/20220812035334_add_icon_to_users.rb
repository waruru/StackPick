class AddIconToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :icon, :string, after: :name
  end
end
