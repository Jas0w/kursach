class Driver < ActiveRecord::Base
  has_one :car
  accepts_nested_attributes_for :car, allow_destroy: true

  validates :id, presence: true, uniqueness: true
  #Добавить уникальность полей :fn, :ln, :birthday, :tin, :passport_series, :passport_number, в совокупности
  validates :fn, :ln, :birthday, :tin, :passport_series, :passport_number,  presence: true
  validates :passport_series, :passport_number, :tin,  numericality: {greater_than: 0}

end
