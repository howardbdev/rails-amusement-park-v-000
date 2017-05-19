class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    if @ride.save
      flash[:notice] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      flash[:error] = "Something went wrong because Howard can't code for shit"
      redirect_to root_path
    end
  end

  private

  # def ride_params
  #   params.require(:ride).permit(:user_id, :attraction_id)
  # end
end
