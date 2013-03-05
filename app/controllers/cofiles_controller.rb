class CofilesController < ApplicationController
  # GET /cofiles
  # GET /cofiles.xml
  def index
     @cofiles = Cofile.search(params[:search])
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cofiles }
    end
  end

  # GET /cofiles/1
  # GET /cofiles/1.xml
  def show
    @cofile = Cofile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cofile }
    end
  end

  # GET /cofiles/new
  # GET /cofiles/new.xml
  def new
    @cofile = Cofile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cofile }
    end
  end

  # GET /cofiles/1/edit
  def edit
    @cofile = Cofile.find(params[:id])
  end

  # POST /cofiles
  # POST /cofiles.xml
  def create
    #raise params.inspect
    @cofile = Cofile.new(params[:cofile])

    respond_to do |format|
      if @cofile.save
        flash[:notice] = 'Cofile was successfully created.'
        format.html { redirect_to(@cofile) }
        format.xml  { render :xml => @cofile, :status => :created, :location => @cofile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cofile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cofiles/1
  # PUT /cofiles/1.xml
  def update
    @cofile = Cofile.find(params[:id])

    respond_to do |format|
      if @cofile.update_attributes(params[:cofile])
        flash[:notice] = 'Cofile was successfully updated.'
        format.html { redirect_to(@cofile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cofile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cofiles/1
  # DELETE /cofiles/1.xml
  def destroy
    @cofile = Cofile.find(params[:id])
    @cofile.destroy

    respond_to do |format|
      format.html { redirect_to(cofiles_url) }
      format.xml  { head :ok }
    end
  end
  
  
  #19Feb2013-import data from excel file
   def import_excel
     # raise params.inspect
      
     if (params[:excel_file] && (params[:product_type] == '1')) || (params[:excel_file] && (params[:product_type] == '2')) 
  		  app_file_content_type = Uploadedfile.app_file_content_type(params[:excel_file]) 	#approved file content type
		  
  			
  			if app_file_content_type                                                        #accept only file of format .xls, .xlsx and .ods.
				    generated_file = Uploadedfile.from_user(params[:excel_file])               	#store metadata & return (assigned) new file(path & name)
  			    File.open(generated_file,"wb") { |f| f.write(params[:excel_file].read) }    #store physical file into designated folder
  			    @cofile = Cofile.from_excel(generated_file,params[:product_type])         #send new file(path & name) to product model, parse & save items into product table & return all imported product
				    @existingcofile = Cofile.view_already_exist_cofile 						          #retrieval of failed import (data already exist in db)
				
  			    if !@cofile 	#if no product exist at all (not even an empty array)
      			  respond_to do |format|
            		flash[:notice] = t('cofile.please_provide_data_in_standard_format_and_file_type_accordingly')
      			    format.html { render :action => "import_cofile_from_excel" } #17Feb2013
      			    format.xml  { head :ok }
      			    flash.discard
      			  end 
  				end
  			    
			   else
  		      respond_to do |format|
      			    flash[:notice] = t('Your selected file')+': <b>'+params[:excel_file].original_filename+'</b> '+t('is not supported')+t('Please select a file of type')
      			    format.html { render :action => "import_cofile_from_excel" } #17Feb2013
      			    format.xml  { head :ok }
      			    flash.discard
      		  end
			   end
  	  
  	  else
  		    respond_to do |format|
  			    flash[:notice] = t('cofile.please_select_a_file_and_product_type')	#21Feb2013
  			    format.html { render :action => "import_cofile_from_excel" } #17Feb2013
  			    format.xml  { head :ok }
  			    flash.discard
  		    end
  	  end     #end of->if (params[:excel_file] && (params[:product_type] == '1')) || (params[:excel_file] && (params[:product_type] == '2')) 
  end         #def import_excel 
  
  def download_comp_format
	    send_file ("#{::Rails.root.to_s}/public/data/standard_format/Filing_format.xls")	#25Feb2013
  end

  def download_other_format
      send_file ("#{::Rails.root.to_s}/public/data/standard_format/hpcomp.xlsx")
  end

  def get_pname_update_preview
	  unless params[:product].blank?
      	product = params[:product]		          #the whole form value was submitted via :with (under :product parameter -> form 4 product) 
		    @product_name = product[:name]	        #retrieve value of field :name ONLY from form :product(edit_product_id)
	  end
	  #product = Product.find(params[:id])	      #use this for product display only
	  render :partial => 'pname_update_preview', :layout => false
  end
  #19Feb2013-import data from excel file
  
end
