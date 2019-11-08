class AddUserIdToGifts < ActiveRecord::Migration[5.2]
  def change
    rename_column :gifts, :recipient_id, :user_id
  end
end
