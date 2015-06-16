class DishMoodsController < ApplicationController
  before_action :set_dish_mood, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :admin
  # GET /dish_moods
  # GET /dish_moods.json
  def index
    @dish_moods = DishMood.all
  end

  # GET /dish_moods/1
  # GET /dish_moods/1.json
  def show
  end

  # GET /dish_moods/new
  def new
    @dish_mood = DishMood.new
  end

  # GET /dish_moods/1/edit
  def edit
  end

  # POST /dish_moods
  # POST /dish_moods.json
  def create
    @dish_mood = DishMood.new(dish_mood_params)

    respond_to do |format|
      if @dish_mood.save
        format.html { redirect_to @dish_mood, notice: 'Dish mood was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dish_mood }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_moods/1
  # PATCH/PUT /dish_moods/1.json
  def update
    respond_to do |format|
      if @dish_mood.update(dish_mood_params)
        format.html { redirect_to @dish_mood, notice: 'Dish mood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_moods/1
  # DELETE /dish_moods/1.json
  def destroy
    @dish_mood.destroy
    respond_to do |format|
      format.html { redirect_to dish_moods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_mood
      @dish_mood = DishMood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_mood_params
      params.require(:dish_mood).permit(:dish_id, :mood_id)
    end

    def admin
      redirect_to root_path unless current_user.admin == true
    end
end
