class FlightsController < ApplicationController
  def index
    if params[:departure_airport] && params[:arrival_airport] && params[:departure_date]

      @flights = Flight.where(departure_airport_id: params[:departure_airport], arrival_airport_id: params[:arrival_airport], departure_time: Date.parse(params[:departure_date]).beginning_of_day..Date.parse(params[:departure_date]).end_of_day)
    end
  end
  
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(params[:flight])
    if @flight.save
      flash[:success] = "Flight successfully created"
      redirect_to @flight
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
    @flight = Flight.find(params[:flight_id])
    render @flight
  end
  
end
