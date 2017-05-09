class Car < ActiveRecord::Base
  belongs_to :driver
  has_many :orders

  validates :model, :class_of_car, :car_number, :year, :color, presence: true
  validates :year, numericality: {greater_than_or_equal_to: 1950}
  validates :class_of_car, inclusion: { in: ['бизнесс', 'эконом']}
end
