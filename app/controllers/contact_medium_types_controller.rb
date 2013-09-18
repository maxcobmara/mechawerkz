class ContactMediumTypesController < ApplicationController
  before_action :set_contact_medium_type, only: [:show, :edit, :update, :destroy]

  # GET /contact_medium_types
  # GET /contact_medium_types.json
  def index
    @contact_medium_types = ContactMediumType.all
  end

  # GET /contact_medium_types/1
  # GET /contact_medium_types/1.json
  def show
  end

  # GET /contact_medium_types/new
  def new
    @contact_medium_type = ContactMediumType.new
  end

  # GET /contact_medium_types/1/edit
  def edit
  end

  # POST /contact_medium_types
  # POST /contact_medium_types.json
  def create
    @contact_medium_type = ContactMediumType.new(contact_medium_type_params)

    respond_to do |format|
      if @contact_medium_type.save
        format.html { redirect_to @contact_medium_type, notice: 'Contact medium type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_medium_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_medium_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_medium_types/1
  # PATCH/PUT /contact_medium_types/1.json
  def update
    respond_to do |format|
      if @contact_medium_type.update(contact_medium_type_params)
        format.html { redirect_to @contact_medium_type, notice: 'Contact medium type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_medium_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_medium_types/1
  # DELETE /contact_medium_types/1.json
  def destroy
    @contact_medium_type.destroy
    respond_to do |format|
      format.html { redirect_to contact_medium_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_medium_type
      @contact_medium_type = ContactMediumType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_medium_type_params
      params.require(:contact_medium_type).permit(:description)
    end
end
