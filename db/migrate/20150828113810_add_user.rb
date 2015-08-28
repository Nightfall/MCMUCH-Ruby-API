class AddUser < ActiveRecord::Migration
  def change
      create_table :users do |t|
          t.string :username
          t.string :email
          t.string :password_hash
      end

      add_reference :content, :user, index: true
      add_foreign_key :content, :users
  end
end
