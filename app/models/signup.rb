class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity
  # validates :time, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 23 }
  # validates :time, presence: true, numericality: {in: 0..23 }
  # validates :time, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 23 }
  validates :time, inclusion: 0..23
end
