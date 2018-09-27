class Article < ApplicationRecord
  has_many :images 
  has_many :notifications
  accepts_nested_attributes_for :images, :allow_destroy => true
end
