
airports = Airport.create([
  { code: 'LAX' },
  { code: 'SFO' },
  { code: 'JFK' },
  { code: 'ATL' }
]) if !Airport.any?

# Populate the flights table with flights between the airports
airports.each do |departure_airport|
  airports.each do |arrival_airport|
    unless departure_airport == arrival_airport
      Flight.create(
        departure_airport_id: departure_airport.id, 
        arrival_airport_id: arrival_airport.id, 
        departure_time: DateTime.now
      )
    end
  end
end