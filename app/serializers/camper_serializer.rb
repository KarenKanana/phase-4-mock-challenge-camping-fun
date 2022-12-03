class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_many :activities, through: :signups
  has_many :signups
  

end
