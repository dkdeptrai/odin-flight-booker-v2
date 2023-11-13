class Booking < ApplicationRecord
	has_many :passenger_bookings
	has_many :passengers, through: :passenger_bookings, inverse_of: :bookings
	belongs_to :flight

	accepts_nested_attributes_for :passenger_bookings

	before_save :find_or_create_passenger

	private

	def find_or_create_passenger
		self.passengers = passengers.map do |passenger_params|
			existing_passenger = Passenger.find_or_create_by(email: passenger_params['email'], name: passenger_params['name'])
			existing_passenger
		end
	end

end
