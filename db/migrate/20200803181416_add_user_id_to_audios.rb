class AddUserIdToAudios < ActiveRecord::Migration[6.0]
  def change
    add_column :audios, :user_id, :integer
  end
end
