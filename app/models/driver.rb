class Driver < ActiveRecord::Base
  belongs_to :car

  validates :fn, :ln, :birthday, :tin, :passport_series, :passport_number,  presence: true
  validates :passport_series, :passport_number, :tin,  numericality: {greater_than: 0}

end
