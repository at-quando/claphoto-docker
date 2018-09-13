class Image < ApplicationRecord
  mount_uploader :name, PhotosUploader
  belongs_to :article
end
