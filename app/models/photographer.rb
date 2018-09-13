class Photographer < ApplicationRecord
  has_many :contract_photographers
  mount_uploader :avatar, AvatarUploader
end
