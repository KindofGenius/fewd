class PagesController < ApplicationController
  def home
    #@full_width = true
    @moods = Mood.all
  end
  def search
    @coords = Geocoder.coordinates(params[:search])
    @street = Geocoder.search(@coords).first.address.split(",").first
    #@hood = Hood.near([address.first, address.last], 2).first
    @moods = Mood.all
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
    @coords = Geocoder.coordinates(params[:search])
    @street = Geocoder.search(@coords).first.address.split(",").first
    #@hood = Hood.near([address.first, address.last], 2).first
    @moods = Mood.all
  end


  def faq
  end
end
