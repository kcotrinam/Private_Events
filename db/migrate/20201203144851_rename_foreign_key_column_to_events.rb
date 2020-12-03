class RenameForeignKeyColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :user_id, :creator_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
