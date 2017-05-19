class AttractionsController < ApplicationController

  before_action :get_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      flash[:notice] = "New attraction #{@attraction.name} successfully created."
      redirect_to @attraction
    else
      flash[:error] = "Something went wrong.  You suck.  Wah- Waaahhhhh."
      redirect_to attractions_path
    end
  end

  def update
    if @attraction.update(attraction_params)
      flash[:notice] = "#{@attraction.name} successfully updated."
      redirect_to @attraction
    else
      flash[:error] = "Something went wrong.  You suck.  Wah- Waaahhhhh."
      redirect_to attractions_path
    end
  end

  private

  def get_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
  end

end
