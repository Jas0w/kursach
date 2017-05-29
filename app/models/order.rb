class Order < ActiveRecord::Base
  belongs_to :tariff
  accepts_nested_attributes_for :tariff, allow_destroy: true

  belongs_to :car

  validates :date_of_order, :time_of_order, :departure_address, :end_address, :passengers, :distance, presence: true
  validates :distance,  numericality: {greater_than: 0}
  validates :passengers,  numericality: {less_than_or_equal_to: 4}


  def self.search(params)
    result = Order.includes(:car).references(:car)
    result = Order.includes(:tariff).references(:tariff)

    if params['tariff_id'].present?
        result = result.where('orders.tariff_id = :tariff_id', {tariff_id: params['tariff_id']})
    end
  
    if params['car_id'].present?
        result = result.where('orders.car_id = :car_id', {car_id: params['car_id']})
    end

    #if params['date_of_order'].present?
        #result = result.where(date_of_order: params['date_of_order'])
    #end

    if params['time_of_order'].present?
        result = result.where(time_of_order: params['time_of_order'])
    end

    if params['departure_address'].present?
        result = result.where(departure_address: params['departure_address'])
    end

    if params['end_address'].present?
        result = result.where(end_address: params['end_address'])
    end

    if params['passengers'].present?
        result = result.where(passengers: params['passengers'])
    end

    if params['distance'].present?
        result = result.where(distance: params['distance'])
    end

    if params['distance'].present?
        result = result.where(distance: params['distance'])
    end

    result.all
  end
  
end
