class ContractPhotographer < ApplicationRecord
  belongs_to :contract, optional: true
  belongs_to :photographer, optional: true
end
