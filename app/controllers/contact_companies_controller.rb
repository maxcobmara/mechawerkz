class ContactCompaniesController < ApplicationController
  before_action :set_contact_company, only: [:show, :edit, :update, :destroy]

  # GET /contact_companies
  # GET /contact_companies.json
  def index
    @contact_companies = ContactCompany.all
  end

  # GET /contact_companies/1
  # GET /contact_companies/1.json
  def show
  end

  # GET /contact_companies/new
  def new
    @contact_company = ContactCompany.new
  end

  # GET /contact_companies/1/edit
  def edit
  end

  # POST /contact_companies
  # POST /contact_companies.json
  def create
    @contact_company = ContactCompany.new(contact_company_params)

    respond_to do |format|
      if @contact_company.save
        format.html { redirect_to @contact_company, notice: 'Contact company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_company }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_companies/1
  # PATCH/PUT /contact_companies/1.json
  def update
    respond_to do |format|
      if @contact_company.update(contact_company_params)
        format.html { redirect_to @contact_company, notice: 'Contact company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_companies/1
  # DELETE /contact_companies/1.json
  def destroy
    @contact_company.destroy
    respond_to do |format|
      format.html { redirect_to contact_companies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_company
      @contact_company = ContactCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_company_params
      params.require(:contact_company).permit(:name, :address, :postcode, :state)
    end
end
