class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin

  # GET /diets
  # GET /diets.json
  def index
    @diets = Diet.all
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
    @coords = params[:location]
    @full_width = true
    dish_diets = DietDish.where("diet_id = ?", @diet.id).map{|d| d.dish_id}
    dishes_no_diet = Dish.joins(:restaurant).near([@coords.first, @coords.last], 0.75)
    @dishes = dishes_no_diet.select{|dish| dish_diets.include?(dish.id)}
    @dishes.shuffle!
  end

  # GET /diets/new
  def new
    @diet = Diet.new
  end

  # GET /diets/1/edit
  def edit
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)

    respond_to do |format|
      if @diet.save
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diet }
      else
        format.html { render action: 'new' }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to diets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_params
      params.require(:diet).permit(:name, :description, :background, :icon)
    end
    
    def admin
      redirect_to root_path unless current_user.admin == true
    end
end
