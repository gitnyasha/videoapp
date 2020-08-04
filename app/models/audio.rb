class Audio < ApplicationRecord
  mount_uploader :file, AudioUploader
  belongs_to :user
end
