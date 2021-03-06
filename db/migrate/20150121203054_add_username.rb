class AddUsername < ActiveRecord::Migration
  def change
  	add_column :users, :user, :string, :null => false
    change_column :users, :email, :string
  	remove_column :users, :encrypted_password, :string
  	remove_column :users, :reset_password_token, :string
  	remove_column :users, :reset_password_sent_at, :string
  end
end
