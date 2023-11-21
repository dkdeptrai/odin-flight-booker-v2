class RemovePassengerFromBooking < ActiveRecord::Migration[7.0]
	def change
		remove_column :bookings, :passenger
	end
end
