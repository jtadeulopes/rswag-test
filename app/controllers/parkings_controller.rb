class ParkingsController < ApplicationController
  def create
    @parking = Parking.new(parking_params)

    if @parking.save
      render json: @parking, status: :created, location: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  private

  def parking_params
    params.fetch(:parking).permit(:plate)
  end
end
