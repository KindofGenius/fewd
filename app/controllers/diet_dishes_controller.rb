class DietDishesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin
  before_action :set_diet_dish, only: [:show, :edit, :update, :destroy]

  # GET /diet_dishes
  # GET /diet_dishes.json
  def index
    @diet_dishes = DietDish.all
  end

  # GET /diet_dishes/1
  # GET /diet_dishes/1.json
  def show
  end

  # GET /diet_dishes/new
  def new
    @diet_dish = DietDish.new
  end

  # GET /diet_dishes/1/edit
  def edit
  end

  # POST /diet_dishes
  # POST /diet_dishes.json
  def create
    @diet_dish = DietDish.new(diet_dish_params)

    respond_to do |format|
      if @diet_dish.save
        format.html { redirect_to @diet_dish, notice: 'Diet dish was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diet_dish }
      else
        format.html { render action: 'new' }
        format.json { render json: @diet_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diet_dishes/1
  # PATCH/PUT /diet_dishes/1.json
  def update
    respond_to do |format|
      if @diet_dish.update(diet_dish_params)
        format.html { redirect_to @diet_dish, notice: 'Diet dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diet_dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diet_dishes/1
  # DELETE /diet_dishes/1.json
  def destroy
    @diet_dish.destroy
    respond_to do |format|
      format.html { redirect_to diet_dishes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_dish
      @diet_dish = DietDish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_dish_params
      params.require(:diet_dish).permit(:dish_id, :diet_id)
    end

    def admin
      redirect_to root_path unless current_user.admin == true
    end
end
