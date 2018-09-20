class Photo < ApplicationRecord
  mount_uploader :photo, PhotosUploader
  belongs_to :story, optional: true
end
