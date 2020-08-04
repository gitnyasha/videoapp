class AddUserIdToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :user_id, :integer
  end
end
