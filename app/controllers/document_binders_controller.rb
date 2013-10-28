class DocumentBindersController < ApplicationController
  before_action :set_document_binder, only: [:show, :edit, :update, :destroy]

  # GET /document_binders
  # GET /document_binders.json
  def index
    @document_binders = DocumentBinder.all
  end

  # GET /document_binders/1
  # GET /document_binders/1.json
  def show
  end

  # GET /document_binders/new
  def new
    @document_binder = DocumentBinder.new
  end

  # GET /document_binders/1/edit
  def edit
  end

  # POST /document_binders
  # POST /document_binders.json
  def create
    @document_binder = DocumentBinder.new(document_binder_params)

    respond_to do |format|
      if @document_binder.save
        format.html { redirect_to @document_binder, notice: 'Document binder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document_binder }
      else
        format.html { render action: 'new' }
        format.json { render json: @document_binder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_binders/1
  # PATCH/PUT /document_binders/1.json
  def update
    respond_to do |format|
      if @document_binder.update(document_binder_params)
        format.html { redirect_to @document_binder, notice: 'Document binder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document_binder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_binders/1
  # DELETE /document_binders/1.json
  def destroy
    @document_binder.destroy
    respond_to do |format|
      format.html { redirect_to document_binders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_binder
      @document_binder = DocumentBinder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_binder_params
      params.require(:document_binder).permit(:code, :description, :volume, :contact_company_id, :owned_by, :location_id)
    end
end
