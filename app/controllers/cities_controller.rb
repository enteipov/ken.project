class CitiesController < ApplicationController

  def index

  end

  def new
    @city = City.new
  end

  def create
     duplicate_entry = duplicate_entry?
     if duplicate_entry == true
       render text: "There's a duplicate"
     else
       @city = City.create(city_params)
       redirect_to '/'
     end
  end

  def edit
  end

  def update
    this_city.update(:name => params[:city][:name])
    this_city.update(:state => params[:city][:state])
    redirect_to :back
  end

  def destroy
    this_city.destroy
    redirect_to :back
  end

  #PRIVATE METHODS
  private
  def city_params
    params.require(:city).permit(:name, :state)
  end

  private
  def this_city
    city = City.find_by(:id => params[:id])
    return city
  end

  private
  def duplicate_entry?
    submitedCity = params[:city][:name]
    submitedCityState = params[:city][:state]
    matchingEntries = ::City.where(name: submitedCity)

    puts matchingEntries
    i = 0
    matchingEntries.each do | match |
      if match[:state] == submitedCityState
        i += 1
      end
    end

    if i > 0
      return true
    else
      return false
    end
  end

end
