class StaffPositionsController < ApplicationController
  before_action :set_staff_position, only: [:show, :edit, :update, :destroy]

  # GET /staff_positions
  # GET /staff_positions.json
  def index
    @staff_positions = StaffPosition.all
  end

  # GET /staff_positions/1
  # GET /staff_positions/1.json
  def show
  end

  # GET /staff_positions/new
  def new
    @staff_position = StaffPosition.new
  end

  # GET /staff_positions/1/edit
  def edit
  end

  # POST /staff_positions
  # POST /staff_positions.json
  def create
    @staff_position = StaffPosition.new(staff_position_params)

    respond_to do |format|
      if @staff_position.save
        format.html { redirect_to @staff_position, notice: 'Staff position was successfully created.' }
        format.json { render action: 'show', status: :created, location: @staff_position }
      else
        format.html { render action: 'new' }
        format.json { render json: @staff_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_positions/1
  # PATCH/PUT /staff_positions/1.json
  def update
    respond_to do |format|
      if @staff_position.update(staff_position_params)
        format.html { redirect_to @staff_position, notice: 'Staff position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @staff_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_positions/1
  # DELETE /staff_positions/1.json
  def destroy
    @staff_position.destroy
    respond_to do |format|
      format.html { redirect_to staff_positions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_position
      @staff_position = StaffPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_position_params
      params.require(:staff_position).permit(:code, :combo_code, :name, :unit, :tasks_main, :tasks_other, :ancestry, :ancestry_depth, :is_acting, :staff_grade_min, :staff_id)
    end
end
