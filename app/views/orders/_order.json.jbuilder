json.extract! order, :id, :tariff_id, :car_id, :date_of_order, :time_of_order, :departure_address, :end_address, :passengers, :distance, :created_at, :updated_at
json.url order_url(order, format: :json)
