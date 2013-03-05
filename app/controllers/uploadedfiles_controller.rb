class UploadedfilesController < ApplicationController
  # GET /uploadedfiles
  # GET /uploadedfiles.xml
  def index
    @uploadedfiles = Uploadedfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uploadedfiles }
    end
  end

  # GET /uploadedfiles/1
  # GET /uploadedfiles/1.xml
  def show
    @uploadedfile = Uploadedfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uploadedfile }
    end
  end

  # GET /uploadedfiles/new
  # GET /uploadedfiles/new.xml
  def new
    @uploadedfile = Uploadedfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uploadedfile }
    end
  end

  # GET /uploadedfiles/1/edit
  def edit
    @uploadedfile = Uploadedfile.find(params[:id])
  end

  # POST /uploadedfiles
  # POST /uploadedfiles.xml
  def create
    @uploadedfile = Uploadedfile.new(params[:uploadedfile])

    respond_to do |format|
      if @uploadedfile.save
        format.html { redirect_to(@uploadedfile, :notice => 'Uploadedfile was successfully created.') }
        format.xml  { render :xml => @uploadedfile, :status => :created, :location => @uploadedfile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uploadedfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uploadedfiles/1
  # PUT /uploadedfiles/1.xml
  def update
    @uploadedfile = Uploadedfile.find(params[:id])

    respond_to do |format|
      if @uploadedfile.update_attributes(params[:uploadedfile])
        format.html { redirect_to(@uploadedfile, :notice => 'Uploadedfile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uploadedfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uploadedfiles/1
  # DELETE /uploadedfiles/1.xml
  def destroy
    @uploadedfile = Uploadedfile.find(params[:id])
    @uploadedfile.destroy

    respond_to do |format|
      format.html { redirect_to(uploadedfiles_url) }
      format.xml  { head :ok }
    end
  end
end
