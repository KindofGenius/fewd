class HoodsController < ApplicationController
  before_action :set_hood, only: [:show, :edit, :update, :destroy, :mood, :foods, :food]

  # GET /hoods
  # GET /hoods.json
  def index
    @hoods = Hood.all
  end

  # GET /hoods/1
  # GET /hoods/1.json
  def show
    @restaurants = Restaurant.near([@hood.latitude, @hood.longitude], 1)
    if params[:yum] == "foods"
      @moods = Food.all
      @yum = "food".to_sym
    elsif params[:yum] == "diets"
      @moods = Diet.all
      @yum = "diet".to_sym
    else
      @moods = Mood.all
      @yum = "mood".to_sym
    end
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

  def mood
    @full_width = true
    @hood = Hood.find(params[:id])
    if params[:food]
      @yum = Food.find(params[:food])
      dish_foods = DishFood.where("food_id = ?", @yum).map{|d| d.dish_id}
      dishes_no_food = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 0.75)
      @dishes = dishes_no_food.select{|dish| dish_foods.include?(dish.id)}
    elsif params[:diet]
      @yum = Mood.find(params[:diet])
      dish_diets = DishDiet.where("diet_id = ?", @yum).map{|d| d.dish_id}
      dishes_no_diet = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 0.75)
      @dishes = dishes_no_diet.select{|dish| dish_diets.include?(dish.id)}      
    else
      @yum = Mood.find(params[:mood])
      dish_moods = DishMood.where("mood_id = ?", @yum).map{|d| d.dish_id}
      dishes_no_mood = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 0.75)
      @dishes = dishes_no_mood.select{|dish| dish_moods.include?(dish.id)}
      @dishes.shuffle!
    end
    #@dishes = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 2)
    #raise "#{@dishes.count}"
    #dish_moods = DishMood.where("mood_id = ?", params[:mood])
    #@dishes = dish_moods.map{|dm| Dish.find(dm.dish_id)}
  end
  def foods
    @moods = Food.all
    @yum = "food".to_sym
    render 'show'
  end
  
  def food
    @full_width = true
    @hood = Hood.find(params[:id])
    @yum = Food.find(params[:food_id])
    dish_foods = DishFood.where("food_id = ?", @yum).map{|d| d.dish_id}
    dishes_no_food = Dish.joins(:restaurant).near([@hood.latitude, @hood.longitude], 1)
    @dishes = dishes_no_food.select{|dish| dish_foods.include?(dish.id)}

    render_selections
  end

  def search
    address = Geocoder.coordinates(params[:search])
    @hood = Hood.near([address.first, address.last], 2)
    redirect_to @hood.first if @hood.count > 0
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
