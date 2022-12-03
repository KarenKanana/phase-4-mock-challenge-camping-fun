class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :activity_id, :time, :name, :difficulty
  has_one :camper
  has_one :activity

  def name
    self.object.activity.name
  end

  def difficulty
    self.object.activity.difficulty
  end

end
