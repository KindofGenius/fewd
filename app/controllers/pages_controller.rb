class PagesController < ApplicationController
  def home
    #@full_width = true
    @moods = Mood.all
  end
  def search
    @coords = Geocoder.coordinates(params[:search])
    any_dishes = Dish.joins(:restaurant).near([@coords.first, @coords.last], 0.75)#check if there is any dishes near by
    if any_dishes.count < 1
      render "hoods/search"
    else
      @street = Geocoder.search(@coords).first.address.split(",").first
      @moods = Mood.all
    end
  end

  def move
    address = request.location
    @hood = Hood.near([address.longitude, address.latitude], 2)
    if @hood.count > 0
      redirect_to @hood.first
    else
      redirect_to hood_path(1)
    end
  end

  def about

  end

  def contact
  end


  def faq
  end
end
