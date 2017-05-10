class Tariff < ActiveRecord::Base
  has_many :orders, inverse_of: :tariffs

  validates :name, :times_of_day, :range, :ppk, presence: true
  validates :times_of_day, inclusion: { in: ['день', 'ночь']}
  validates :range, inclusion: { in: ['в пределах МКАД', 'за МКАД', 'Подмосковье']}
end
