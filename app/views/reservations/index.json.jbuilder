json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :guests, :startdate, :enddate
  json.url reservation_url(reservation, format: :json)
end
