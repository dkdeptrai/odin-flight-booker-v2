class Flight < ApplicationRecord
	belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id', inverse_of: :departing_flights
	belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id', inverse_of: :arriving_flights
	has_many :bookings, inverse_of: :flight
	has_many :passengers, through: :bookings

	def details
		"Departure from #{departure_airport.code} at #{departure_time.strftime('%H:%M:%S')} to #{arrival_airport.code}"
	end
end
