class Upfile < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
  belongs_to :user_data_file
end