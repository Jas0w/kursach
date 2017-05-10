class Order < ActiveRecord::Base
  belongs_to :tariff
  accepts_nested_attributes_for :tariff, allow_destroy: true

  belongs_to :car

  validates :date_of_order, :time_of_order, :departure_address, :end_address, :passengers, :distance, presence: true
  validates :distance,  numericality: {greater_than: 0}
  validates :passengers,  numericality: {less_than_or_equal_to: 4}
end
