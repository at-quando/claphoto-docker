class Story < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :cover, PhotosUploader
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true
end
