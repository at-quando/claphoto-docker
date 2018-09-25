class ContractSerializer < ActiveModel::Serializer
  attributes :id, :school, :town, :school_year, :group, :taken_date
  has_many :viewers
end
