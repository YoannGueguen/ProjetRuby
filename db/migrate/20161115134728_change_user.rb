class ChangeUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :users_id, :user_id
  end
end
