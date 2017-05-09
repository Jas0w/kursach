json.extract! tariff, :id, :name, :times_of_day, :range, :ppk, :created_at, :updated_at
json.url tariff_url(tariff, format: :json)
