class BookingsController < ApplicationController
	def new
		@booking = Booking.new
		@flight = Flight.find(params[:flight_id])
		params[:number_of_passengers].to_i.times { @booking.passenger_bookings.build(passenger: Passenger.new) }
		@booking.flight = @flight
		puts "Flight ID : #{@flight.id}"

		render :new
	end

	def create
		@booking = Booking.new(booking_params)
		@flight = Flight.find(booking_params[:flight_id])
		if @booking.save
			flash[:success] = 'Booking successfully created'
			redirect_to booking_path(@booking)
		else
			flash[:error] = "Something went wrong"
			puts "something went wrong #{@booking.errors.full_messages}"
			render :new
		end
	end

	def show
		@booking = Booking.find(params[:id])
		@flight = @booking.flight
		@passengers = @booking.passengers
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, passenger_bookings_attributes: [:id, passenger_attributes: [:name, :email]])
	end

end
