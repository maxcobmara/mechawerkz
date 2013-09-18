class ContactMediaController < ApplicationController
  before_action :set_contact_medium, only: [:show, :edit, :update, :destroy]

  # GET /contact_media
  # GET /contact_media.json
  def index
    @contact_media = ContactMedium.all
  end

  # GET /contact_media/1
  # GET /contact_media/1.json
  def show
  end

  # GET /contact_media/new
  def new
    @contact_medium = ContactMedium.new
  end

  # GET /contact_media/1/edit
  def edit
  end

  # POST /contact_media
  # POST /contact_media.json
  def create
    @contact_medium = ContactMedium.new(contact_medium_params)

    respond_to do |format|
      if @contact_medium.save
        format.html { redirect_to @contact_medium, notice: 'Contact medium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_medium }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_media/1
  # PATCH/PUT /contact_media/1.json
  def update
    respond_to do |format|
      if @contact_medium.update(contact_medium_params)
        format.html { redirect_to @contact_medium, notice: 'Contact medium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_media/1
  # DELETE /contact_media/1.json
  def destroy
    @contact_medium.destroy
    respond_to do |format|
      format.html { redirect_to contact_media_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_medium
      @contact_medium = ContactMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_medium_params
      params.require(:contact_medium).permit(:person_id, :company_id, :medium_type, :medium)
    end
end
