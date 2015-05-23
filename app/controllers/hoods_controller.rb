class HoodsController < ApplicationController
  before_action :set_hood, only: [:show, :edit, :update, :destroy, :mood, :foods, :food, :moods, :diets, :diet]

  # GET /hoods
  # GET /hoods.json
  def index
    @hoods = Hood.all
  end

  # GET /hoods/1
  # GET /hoods/1.json
  def show
    @restaurants = Restaurant.near([@hood.latitude, @hood.longitude], 0.75)
    @moods = Mood.all
    @foods = Food.all
    @diets = Diet.all
  end

  # GET /hoods/new
  def new
    @hood = Hood.new
  end

  # GET /hoods/1/edit
  def edit
  end

  # POST /hoods
  # POST /hoods.json
  def create
    @hood = Hood.new(hood_params)

    respond_to do |format|
      if @hood.save
        format.html { redirect_to @hood, notice: 'Hood was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hood }
      else
        format.html { render action: 'new' }
        format.json { render json: @hood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hoods/1
  # PATCH/PUT /hoods/1.json
  def update
    respond_to do |format|
      if @hood.update(hood_params)
        format.html { redirect_to @hood, notice: 'Hood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoods/1
  # DELETE /hoods/1.json
  def destroy
    @hood.destroy
    respond_to do |format|
      format.html { redirect_to hoods_url }
      format.json { head :no_content }
    end
  end
  
  def moods
    @restaurants = Restaurant.near([@hood.latitude, @hood.longitude], 0.75)
    @moods = Mood.all
    render "show"
  end

  def mood
    @full_width = true
    @hood = Hood.find(params[:id])
    @mood = Mood.find(params[:mood_id])
    dish_moods = DishMood.where("mood_id = ?", @mood).map{|d| d.dish_id}
    dishes_no_mood = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 0.75)
    @dishes = dishes_no_mood.select{|dish| dish_moods.include?(dish.id)}
    @dishes.shuffle!
  end

  def diets
    @restaurants = Restaurant.near([@hood.latitude, @hood.longitude], 0.75)
    @moods = Diet.all
    render "show"
  end

  def diet
    @full_width = true
    @hood = Hood.find(params[:id])
    @mood = Diet.find(params[:diet_id])
    dish_moods = DietDish.where("diet_id = ?", @mood).map{|d| d.dish_id}
    dishes_no_mood = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 0.75)
    @dishes = dishes_no_mood.select{|dish| dish_moods.include?(dish.id)}
    @dishes.shuffle!
    render "mood"
  end

  def foods
    @moods = Food.all
    render 'show'
  end
  
  def food
    @full_width = true
    @hood = Hood.find(params[:id])
    @mood = Food.find(params[:food_id])
    dish_moods = DishFood.where("food_id = ?", @mood).map{|d| d.dish_id}
    dishes_no_mood = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 0.75)
    @dishes = dishes_no_mood.select{|dish| dish_moods.include?(dish.id)}
    @dishes.shuffle!
    render "mood"
  end

  def search
    address = Geocoder.coordinates(params[:search])
    @hood = Hood.near([address.first, address.last], 2)
    redirect_to @hood.first if @hood.count > 0
  end

  def exact
    @coords = Geocoder.coordinates(params[:search])
    @street = Geocoder.search(@coords).first.address.split(",").first
    #@hood = Hood.near([address.first, address.last], 2).first
    @moods = Mood.all
  end

  private

    def render_selections
      render 'selections'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_hood
      @hood = Hood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hood_params
      params.require(:hood).permit(:address, :city, :state, :country, :longitude, :latitude, :avatar, :name)
    end
end
