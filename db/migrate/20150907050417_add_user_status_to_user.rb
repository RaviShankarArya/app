class AddUserStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_status, :boolean, :default => false
  end
end
