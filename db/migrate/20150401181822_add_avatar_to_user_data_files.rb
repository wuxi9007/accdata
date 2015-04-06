class AddAvatarToUserDataFiles < ActiveRecord::Migration
  def change
  	add_column :user_data_files, :avatar, :string
  end
end
