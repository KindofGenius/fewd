class DishFoodsController < ApplicationController
  before_action :set_dish_food, only: [:show, :edit, :update, :destroy]

  # GET /dish_foods
  # GET /dish_foods.json
  def index
    @dish_foods = DishFood.all
  end

  # GET /dish_foods/1
  # GET /dish_foods/1.json
  def show
  end

  # GET /dish_foods/new
  def new
    @dish_food = DishFood.new
  end

  # GET /dish_foods/1/edit
  def edit
  end

  # POST /dish_foods
  # POST /dish_foods.json
  def create
    @dish_food = DishFood.new(dish_food_params)

    respond_to do |format|
      if @dish_food.save
        format.html { redirect_to @dish_food, notice: 'Dish food was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dish_food }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_foods/1
  # PATCH/PUT /dish_foods/1.json
  def update
    respond_to do |format|
      if @dish_food.update(dish_food_params)
        format.html { redirect_to @dish_food, notice: 'Dish food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_foods/1
  # DELETE /dish_foods/1.json
  def destroy
    @dish_food.destroy
    respond_to do |format|
      format.html { redirect_to dish_foods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_food
      @dish_food = DishFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_food_params
      params.require(:dish_food).permit(:dish_id, :food_id)
    end
end
