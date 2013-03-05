class Cofile < ActiveRecord::Base
  # befores, relationships, validations, before logic, validation logic, 
  #controller searches, variables, lists, relationship checking
  
  before_save :save_my_vars
  
  validates_presence_of :name,:company,:division#,:cofileno :location, :owner_id,   #15Feb2013-company added   
  # => TEMPORARY HIDE 19FEB2013-data although not save & not even in db...error arise:data already exist ms nak import ...
  # due to p.save -> p not valid (p=Cofile.new/self.new) - where p upon saving of cofile record, p must valid WITH...ITS..properties/fields that
  #compulsory --> refer validated_presence_of.....;-)
  validates_uniqueness_of :name #22Feb2013
  
  belongs_to :owner,    :class_name => 'Staff', :foreign_key => 'owner_id' 
  belongs_to :borrower, :class_name => 'Staff', :foreign_key => 'staffloan_id' 
  
  has_many :documents, :foreign_key => 'file_id'
  has_many :sdiciplines, :foreign_key => 'file_id'
  has_many :student_discipline_cases, :foreign_key => 'file_id'
  
  #Link to Model Sdicipline
  #has_many :file,       :class_name => 'Sdicipline', :foreign_key => 'cofile_id'
  has_many :counsellings
  
  attr_accessor :detail_no, :main_class, :sub_class, :sub_class2, :sub_class3, :sub_class4, :sub_class5, :cofile_code2  #TEMP-later add-in column..



  def file_no_and_name
    if cofile_code.nil? 
       "#{cofileno} | #{name}"                  #26Feb2013-International code added
    else
      "#{cofileno} | #{name} | #{cofile_code}"  #26Feb2013-International code added
    end
  end
  
  
  def owner_details
    suid = owner_id.to_a
    exists = Staff.find(:all, :select => "id").map(&:id)
    checker = suid & exists
    
    if owner_id == nil
      ""
    elsif checker == []
      "Staff No Longer Exists"
    else
      #owner.mykad_with_staff_name
      owner.name  #15Feb2013-display name only
    end
  end
  
  def borrower_details
    suid = staffloan_id.to_a
    exists = Staff.find(:all, :select => "id").map(&:id)
    checker = suid & exists
    
    if staffloan_id == nil
      ""
    elsif checker == []
      "Staff No Longer Exists"
    else
      #borrower.mykad_with_staff_name
      borrower.name   #19Feb2013-display staff name only
    end
  end
   
  def self.find_main
   Staff.find(:all, :condition => ['staff_id IS NULL'])
  end
   
  def self.search(search)
    if search     #sort record display by cofileno
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"], :order => :cofileno)  #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all, :order => :cofileno) #find(:all)
    end
  end
  
  #-19Feb2013 set row color according to file owner/department --> DIVISION
  def set_row_color
  	if division == 1                    # Support service & Admin
		  'yellow2'   
		elsif division == 3                 # Tender
		  'yellow2'
  	elsif division == 4                 # IT project
  		'pink'    
    elsif division == 2                 # Marketing
   		'orange'
	  elsif division == 5                 # Engineering project
	    'green2'
	  elsif division == 6                 # Project Manager
	    'white'
    end  
  end

  
  #coded list for locations - 15Feb2013
  LOCATION = [
		#Displayed	Stored in db
		["First Floor Admin Cabinet", 1],                 #Support Service & Admin / Division Tender - yellow, marketing-orange
		["First Floor Close Admin Cabinet", 2],           #Support Service & Admin / Division Tender - yellow
		["First Floor MD Cabinet 1", 3],                  #IT Project - pink
		["First Floor MD Cabinet 2", 4],	                #IT Project - pink
		["First Floor Filling Room-Sect TPL-A/1", 5],     #Engineering Project - green
		["First Floor Filling Room-Sect TPL-A/2", 6],     #Engineering Project - green
		["First Floor Filling Room-Sect TPL-A/3", 7],     #Engineering Project - green
		["First Floor Filling Room-Sect TPL-A/4", 8],     #Engineering Project - green
		["Ground Floor IT Cabinet", 9],                   #IT Project - pink
		["Ground Floor PM Cabinet", 10]                   #Engineering Project - white (project manager)
  ]
    
  #coded list for divisions - 19Feb2013
  DIVISION = [
		#Displayed	Stored in db
		["Support Service & Admin", 1],        #yellow
		["Marketing", 2],                      #orange
		["Tender", 3],                        #yellow
		["IT Project", 4],                    #pink
		["Engineering Project", 5],	          #green
		["Project Manager", 6]                #white
  ]
    
  #22Feb2013 - coded list for cofile_no (main)
  MAIN_CLASSIFICATION = [
    #Displayed	                Stored in db
    ["01 Project Management Plan",            1 ],
    ["02 Administrative Requirements",        2 ],
    ["03 Finance",                            3 ],
    ["04 ILS Requirements",                   4 ],
    ["05 Quality Assurance",                  5 ],
    ["06 Risk Management Plan",               6 ],
    ["08 Client Documentation & References",  8 ],
    ["09 Submissions",                        9 ]
 ]
  
  #22Feb2013 - coded list for cofile_no - subset of project management
  PROJECT_MGMT = [
    #Displayed	Stored in db
    ["0101 General",                                      101   ],
    ["0102 Project Objective WorkScope And Deliverables", 102   ],
    ["0103 Organisation & Administration",                103   ],
    ["0104 Communication & Reporting",                    104   ],
    ["0105 Implementation Plan",                          105   ],
    ["0106 Quality Management",                           106   ],
    ["0107 Configuration Management Plan",                107   ],
    ["0108 Change Management Plan",                       108   ],
    ["0109 Risk Management Plan",                         109   ],
    ["0110 Training Plan",                                110  ],
    ["0111 Follow On Support",                            111  ],
    ["0112 List of Abbreviations",                        112  ]
    
 ] 
 
  #22Feb2013 - coded list for cofile_no - subset of Administrative Requirement
  ADMIN_REQ = [
    #Displayed	Stored in db
    ["0201 Project Memo",                       201   ],
    ["0202 Acquisition Plan",                   202   ],
    ["0203 Change Proposals",                   203   ],
    ["0204 Contract",                           204   ],
    ["0205 Correspondence",                     205   ],
    ["0206 Definitions",                        206   ],
    ["0207 Work Specifications",                207   ],
    ["0208 Client Furnished Information",       208   ],
    ["0209 Client Furnished Services",          209   ],
    ["0210 Specifications & Standard",          210  ],
    ["0211 Quotations",                         211  ],
    ["0212 Purchase Orders",                    212  ],
    ["0213 Delivery Orders",                    213  ],
    ["0214 Reports",                            214  ],
    ["0215 Minutes of Meetings",                215  ],
    ["0216 Seminars, Events",                   216  ],
    ["0217 Project Forms",                      217  ],
    ["0218 Project Address Book",               218  ],
    ["0219 Calender",                           219  ],
    ["0220 User Forum, Management Tool",        220  ]
 ]
 
 #22Feb2013 - coded list for cofile_no - subset of FINANCE
  #Displayed	Stored in db
  FINANCE = [
    ["0301 Acquisition Costs",301],
    ["0305 Banking",305],
    ["0306 Cashflow",306]
 ]
 #22Feb2013 - coded list for cofile_no - subset of ILS requirement
  ILS_REQ = [
    #Displayed	Stored in db
    ["0401 Packaging & Handling",                   401],
    ["0402 Storage",                                402],
    ["0403 Transportation Modes",                   403],
    ["0404 Technical Manuals",                      404],
    ["0405 Approval Criteria & Procedures",         405],
    ["0406 Engineering Drawings",                   406],
    ["0407 Equipment Manuals",                      407],
    ["0408 Index of Technical Publications",        408],
    ["0409 Manuals",                                409],
    ["0410 Production & Distribution Requirements", 410],
    ["0411 Training Aid Book",                      411],
    ["0420 Facilities",                             420],
    ["0421 General Facilities",                     421],
    ["0422 Training Facilities",                    422],
    ["0423 Warehousing",                            423],
    ["0430 Personnel & Training",                   430],
    ["0431 Courses",                                431],
    ["0440 Manning Requirements",                   440],
    ["0441 Personnel",                              441],
    ["0442 Training Reports",                       442],
    ["0443 Work Study",                             443],
    ["0450 Technical Drawings & Schematics",        450],
    ["0451 Design Documents",                       451],
    ["0452 Equipment Preparation",                  452],
    ["0499 Project Sales",                          499]
	 	
 ]
 
 #22Feb2013 - coded list for cofile_no - subset of Quality Assurance       
  QUALITY_ASSURANCE = [
    #Displayed	Stored in db
    ["0501	TestGuides",                      501],
    ["0502	Request For Inspection",          502],
    ["0503	Raw Test Results",                503],
    ["0516	Value Engineering",               516],
    ["0520	UAT",                             520],
    ["0521	UAT Documentation",               521],
    ["0522	UAT Certificates",                522],
    ["0550	Issue Management / Help Desk",    550]
 ]
 
 #26Feb2013
 #def self.take_this_instead
  # if sub_class == classification
 #end
 
 #26Feb2013
 
 
  #22Feb2013-standard numbering
  def save_my_vars
	  #25Feb2013-copy value of subclassX to variable sub_class_val----
	  if main_class == '1'#sub_class != nil
		  sub_class_val = sub_class 
	  elsif main_class == '2'
		  sub_class_val = sub_class2 
	  elsif main_class == '3'
		  sub_class_val = sub_class3 
	  elsif main_class == '4'
		  sub_class_val = sub_class4 
	  elsif main_class == '5'
		  sub_class_val = sub_class5 
	  elsif main_class == '6'	
		  sub_class_val = main_class 		#sub_classX not exist
	  elsif main_class == '8'
		  sub_class_val = main_class 		#sub_classX not exist
	  elsif main_class == '9'
		  sub_class_val = main_class 		#sub_classX not exist
	  end
	  #25Feb2013-copy value of subclassX to variable sub_class_val----
	  
	  if cofile_code == nil	 #===========24Feb2013-if NEW file (cofile_code not yet saved in db)- assign values
		  unless sub_class_val == nil 
			  self.classification = sub_class_val.to_i		#23Feb2013-changed from sub_class to sub_class_val
			  self.cofile_code = (suggested_serial_no(sub_class_val)).to_s
		  end
	  else	#===========25Feb2013-if EDIT file
	    
	    classification_db = Cofile.find(id).classification.to_s   #read classification in db
	    
		  if classification_db != sub_class_val.to_s ##*********26Feb2013 - if previously saved classification data differ from currently selected by user, make changes to db 
		     self.classification = sub_class_val.to_i		#23Feb2013-changed from sub_class to sub_class_val
  			 self.cofile_code = (suggested_serial_no(sub_class_val)).to_s
  		else ##26Feb2013********* - else don't make any changes to db 
  		  #ignores - do nothing - cofile_code & classification in db remains unchanged
		  end 
		  
	  end
  end
  #22Feb2013-standard numbering
  
  #22Feb2013-standard numbering
  def suggested_serial_no(subclassval)
	#23feb2013-added condition----
	cc_a = []		
	Cofile.all.each do |cc|
		cc_a<<cc.classification
	end
    					
	#line below : checking for any record with same classification value-if exist increment suggested serial no by 1 if not exist SET suggested serial no to 1
	if cc_a.include? self.classification.to_i	
		#'0'+self.classification.to_s+'-'+((Cofile.find(:last, :conditions=>['classification=?',sub_class2.to_s],:select=>:cofile_code).cofile_code).split("-")[1].to_i+1).to_s
		'0'+self.classification.to_s+'-'+((Cofile.find(:last, :conditions=>['classification=?',subclassval.to_i],:select=>:cofile_code).cofile_code).split("-")[1].to_i+1).to_s #RECHECK subclassval.to_i vs subclassval..to_s
	else
		'0'+self.classification.to_s+'-'+'1'
	end
	#23feb2013-added condition----
  end
  #22Feb2013-standard numbering
  
  #19Feb2013 - add for import data from excel file
   def self.from_excel(generated_file, product_type)

     file_extension = File.extname(generated_file).sub( /^\./, '' ).downcase

 	  case file_extension   #replace if statement with case statement
 		  when 'xlsx'
 			  oo = Roo::Excelx.new(generated_file)
 		  when 'xls'
 			  oo = Roo::Excel.new(generated_file)
 		  when 'ods'
 			  oo = Roo::Openoffice.new(generated_file)
 			  #oo = Excel.new("simple_spreadsheet.xls")
 	  end

     oo.default_sheet = oo.sheets.first
 	  comp_vs_other = ''

     3.upto(3) do |line|
       comp_vs_other = oo.cell(3,2)    #retrieve data at location (line 3,column 2) of spreadsheet
 	  end

 	  if (product_type == '1') && (comp_vs_other != 'File no')    #check if provided file follows standard format of selected product type (computer packages).
 		  comp_spec_name = []						#17Feb2013 - change 'part_no' to 'File No'

 		  1.upto(oo.first_column) do |column|
 			  1.upto(oo.last_row) do |line|
 				  comp_spec_name[line] = oo.cell(line, column)
 			  end
 		  end

 		  @product = []
 		  @exist_product = []
 		  comp_spec = []

 		  2.upto(oo.last_column) do |column|
 			  p = self.new	  
 			 # p.description=''

 			  3.upto(oo.last_row) do |line|
 				  comp_spec[line] = oo.cell(line, column)

 				  case comp_spec_name[line] 
 					  when 'model'
 						  p.name = oo.cell(line, column) 
 					  when 'part_no'
 						  p.name = p.name.to_s+' '+comp_spec[line].gsub(/\n/,"<br />").to_s    #Matches whitespace. \s-> Equivalent to [\t\n\r\f] -> replace new line with space.
 					  when 'image'
 						  p.image = oo.cell(line, column)
 					  when 'promo_price'
 						  p.price = oo.cell(line, column)

 				  end         #end of case comp_spec_name[line] 
 				  ##+++++++++++++++++++++++++
 				  ##++++++++++++++++++++++++
 			  end	          #end of 3.upto(oo.last_row) do |line|

 																 #name --> char in db-table product - can't make use of to_s
 			  count_exist_product = Cofile.count :conditions => "name ="+"'"+p.name.to_s+"'" 	#Product.count :conditions => "name ="+"'"+p.name+"'" 	
 			  count_exist_product.to_i

 			  if p.valid? && count_exist_product == 0
 				  @product << p
 				  p.save
 			  else
 				  @exist_product << p
 			  end
 		  end             #end of 2.upto(oo.last_column) do |column|
 		  @product

 	  elsif (product_type == '2') && (comp_vs_other == 'File No')      #check if provided file follows standard format of selected product type (other products).

 		  prod_spec_name = []						#17Feb2013 - change 'part_no' to 'File No'

 		  3.upto(3) do |line|   
 			  1.upto(oo.last_column) do |column|
 				  prod_spec_name[column] = oo.cell(line, column)
 			  end
 		  end

 		  @product = []
		  @exist_product = []
		  prod_spec = []

		  4.upto(oo.last_row) do |line|
			  p = self.new 	  
  
			  2.upto(oo.last_column) do |column|    #data starts at SECOND column
				  prod_spec[column] = oo.cell(line,column)
 
          #22Feb2013-revised part for data extraction
	        case prod_spec_name[column] 
		        when 'File No'								
			        p.cofileno = oo.cell(line, column) 		
		        when 'File Name'								#compulsory fields
			        p.name = oo.cell(line,column)    	
		        when 'Company'								#compulsory fields
			        p.company = (oo.cell(line,column)).to_i
		        when 'Location'								#compulsory fields
			        p.location = (oo.cell(line,column)).to_i
		        when 'Division'
			        p.division = (oo.cell(line,column)).to_i
		        when 'Owner'
			        p.owner_id = (oo.cell(line,column)).to_i
		        when 'Remark'
			        p.remark = oo.cell(line,column)   
				  end           #end of case prod_spec_name[line]
				  #22Feb2013-revised part for data extraction
				  
    		end     		    #end of 1.upto(oo.last_column) do |column| 
 	      
																 #name --> char in db-table product - can't make use of to_s (to string)
			  count_exist_product = Cofile.count :conditions => "name ="+"'"+p.name+"'" 	
			  count_exist_product.to_i

			  if p.valid? # && count_exist_product == 0
				  @product << p
				  p.save
			  else
				  @exist_product << p
			  end
    
		  end       			  #end of 4.upto(oo.last_row) do |line|
		  @product 
     

 	  end 					      #end of if product_type == '2'	
   end               		#end of def self.from_excel

   def self.view_already_exist_cofile
 		@exist_product
   end
  #19Feb2013 - add for import data from excel file   

 
 
end
