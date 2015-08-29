class UserUuidHash < ActiveRecord::Migration
  def change
    remove_column :users, :username
    remove_column :users, :email
    remove_column :users, :password_hash

    add_column :users, :uuid_hash, :string
  end
end
