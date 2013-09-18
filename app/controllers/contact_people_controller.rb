class ContactPeopleController < ApplicationController
  before_action :set_contact_person, only: [:show, :edit, :update, :destroy]

  # GET /contact_people
  # GET /contact_people.json
  def index
    @contact_people = ContactPerson.all
  end

  # GET /contact_people/1
  # GET /contact_people/1.json
  def show
  end

  # GET /contact_people/new
  def new
    @contact_person = ContactPerson.new
  end

  # GET /contact_people/1/edit
  def edit
  end

  # POST /contact_people
  # POST /contact_people.json
  def create
    @contact_person = ContactPerson.new(contact_person_params)

    respond_to do |format|
      if @contact_person.save
        format.html { redirect_to @contact_person, notice: 'Contact person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_person }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_people/1
  # PATCH/PUT /contact_people/1.json
  def update
    respond_to do |format|
      if @contact_person.update(contact_person_params)
        format.html { redirect_to @contact_person, notice: 'Contact person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_people/1
  # DELETE /contact_people/1.json
  def destroy
    @contact_person.destroy
    respond_to do |format|
      format.html { redirect_to contact_people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_person
      @contact_person = ContactPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_person_params
      params.require(:contact_person).permit(:name, :company_id, :position)
    end
end
