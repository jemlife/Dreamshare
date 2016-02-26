class ChangeUserColumnInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user
  end
end
