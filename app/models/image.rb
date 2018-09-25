class Image < ApplicationRecord
  mount_uploader :name, PhotosUploader
  belongs_to :article, optional: true
  belongs_to :cloth, optional: true
end
