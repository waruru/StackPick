class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name,     :string, after: :email
    add_column :users, :token,    :string, after: :encrypted_password
    add_column :users, :uid,      :string, after: :encrypted_password
    add_column :users, :provider, :string, after: :encrypted_password
  end
end
