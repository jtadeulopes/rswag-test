class ParkingsController < ApplicationController
  before_action :set_parking, only: [:pay]

  def create
    @parking = Parking.new(parking_params)

    if @parking.save
      render json: @parking, status: :created, location: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  def pay
    @parking.pay!

    render json: @parking.as_json(methods: [:ticket]), status: :ok, location: @parking
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.fetch(:parking).permit(:plate)
  end
end
