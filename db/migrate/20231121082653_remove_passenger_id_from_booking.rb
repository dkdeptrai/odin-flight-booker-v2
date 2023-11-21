class RemovePassengerIdFromBooking < ActiveRecord::Migration[7.0]
	def change
		remove_column :bookings, :passenger_id
	end
end
