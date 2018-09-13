class Cart < ApplicationRecord
  belongs_to :contract
  belongs_to :cloth, optional: true
  belongs_to :accessory, optional: true
end
