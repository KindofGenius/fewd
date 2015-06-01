class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  # GET /dishes
  # GET /dishes.json
  def index
    #@dishes = Dish.paginate(:page => params[:page], :per_page => 30).order('name ASC')
    @dishes = Dish.all
    @dishes_grid = initialize_grid(@dishes)
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @restaurant = Restaurant.find(@dish.restaurant_id)
    @full_width = true
    @services = @restaurant.services
    @others = @restaurant.dishes.where.not(id: @dish.id)
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
    @dish.dish_images.build
  end

  # GET /dishes/1/edit
  def edit
    @dish.dish_images.build
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dish }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
        format.js {redirect_to dishes_paths, notice: 'Dish was successfully updated.'}
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:restaurant_id, :name, :tag_list, mood_ids: [], diet_ids: [], food_ids: [], dish_images_attributes: [:id, :dish_id, :avatar, :_destroy])
    end
end
