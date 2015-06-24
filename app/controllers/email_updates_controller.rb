class EmailUpdatesController < ApplicationController
  before_action :set_email_update, only: [:show, :edit, :update, :destroy]
  before_action :email_update_params, except:[:create]

  # GET /email_updates
  # GET /email_updates.json
  def index
    @email_updates = EmailUpdate.all
  end

  # GET /email_updates/1
  # GET /email_updates/1.json
  def show
  end

  # GET /email_updates/new
  def new
    @email_update = EmailUpdate.new
  end

  # GET /email_updates/1/edit
  def edit
  end

  # POST /email_updates
  # POST /email_updates.json
  def create
    @email_update = EmailUpdate.new
    @email_update.email = params[:email]

    respond_to do |format|
      if @email_update.save
        format.html { redirect_to :back, notice: 'Your email was added to our mailing list.' }
        format.json { render action: 'show', status: :created, location: @email_update }
      else
        format.html { render action: 'new' }
        format.json { render json: @email_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_updates/1
  # PATCH/PUT /email_updates/1.json
  def update
    respond_to do |format|
      if @email_update.update(email_update_params)
        format.html { redirect_to @email_update, notice: 'Email update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_updates/1
  # DELETE /email_updates/1.json
  def destroy
    @email_update.destroy
    respond_to do |format|
      format.html { redirect_to email_updates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_update
      @email_update = EmailUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_update_params
      #params.require(:email_update).permit(:email)
    end
end
