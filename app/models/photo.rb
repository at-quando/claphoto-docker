class Photo < ApplicationRecord
  mount_uploader :photo, PhotosUploader
end
