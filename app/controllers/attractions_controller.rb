class AttractionsController < ApplicationController

  before_action :get_attraction, only: [:show]

  def index
    @attractions = Attraction.all
  end

  def show
    @user = current_user
  end

  private

  def get_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end
