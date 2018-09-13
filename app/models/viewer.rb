class Viewer < ApplicationRecord
  belongs_to :contract
  has_many :pictures
end
