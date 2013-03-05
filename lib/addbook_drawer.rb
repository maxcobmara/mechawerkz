class AddbookDrawer
  require 'pdf/writer' #------ 14 May 2012 - create pdf for examquestion ----------
	require 'pdf/simpletable'
	
	def self.draw(listadd)
		#pdf = PDF::Writer.new(:paper => [40,60], :orientation => :landscape)
		pdf = PDF::Writer.new(:paper => "A4", :orientation => :landscape, :font_size =>8)
		pdf.margins_pt(40, 50, 30, 30)  #top, left, bottom, right
		#examquestion_lines = "test"
		#pdf.text examquestion_lines --> will be rendered by line 35 (pdf.render)
	
		row_count = 0
		data_array = []
		
		listadd.sort.each do |compname, comp_details|
		  comp_details.each do |detail|
		      #formatting for contact person--
		      contactperson=''
		      if detail.contact_person.include? ','
    					contact = [] 
    					contact = detail.contact_person.split(/,/) 
    					contact.each_with_index do |aa, index|
    						  contactperson += aa
    						  if index!= contact.count-1 
    						    contactperson+=","
    						  end 
    						  #contactperson+="<br>"
    					end
    			else 
    					contactperson = detail.contact_person 
    			end 
		      #formatting for contact person--
		  #25Feb2013------previous format----no longer use---refer 'phones' table---all fax no inserted into 'phones' table*******    
		      #formatting for phone no--
		      #telephone=''
		      #if detail.phone.include? ','
    				  #phoneno = []
    				  #phoneno = detail.phone.split(/,/)
    					#phoneno.each_with_index do |bb, index|
    						 #telephone += bb 
    					   #if index!= phoneno.count-1
    					     #telephone+="," 
    					   #end
    					   #telephone+='<br>'
    					#end
    			#else
              #telephone = detail.phone 
    			#end 
		      #formatting for phone no--
		  #25Feb2013------previous format----no longer use---refer 'phones' table---all fax no inserted into 'phones' table******** 
		      #25Feb2013-formatting for PHONE NOs (Direct Line,Fixed Line,General Line,Hunting Line,Mobile & Fax)--NEW-use of 'phones' table
		      telephone=[]
		      phonetype_acronym=''
		      if detail.phones.count != 0
		        detail.phones.each do |phoneno|
		            if phoneno.phone_type == '1'
		              phonetype_acronym = "GL" 
		            elsif phoneno.phone_type == '2'
		              phonetype_acronym = "HL"
		            elsif phoneno.phone_type == '3'
		              phonetype_acronym = "DL"  
		            elsif phoneno.phone_type == '4'
		              phonetype_acronym = "M"
		            elsif phoneno.phone_type == '5'
		              phonetype_acronym = "F"
		            end
		            telephone << phoneno.phone_no + "("+phonetype_acronym+")"
		        end
		      end
		      #25Feb2013-formatting for PHONE NOs (Direct Line,Fixed Line,General Line,Hunting Line,Mobile & Fax)--NEW-use of 'phones' table
		  #25Feb2013------previous format----no longer use---refer 'phones' table---all fax no inserted into 'phones' table********
		      #formatting for fax no--
		      #faxnumber=''
		      #if detail.fax.include? ','
    			    #faxno = [] 
    			    #faxno = detail.fax.split(/,/) 
    			    #faxno.each_with_index do |cc, index|
    				      #faxnumber+=cc 
    					    #if index!= faxno.count-1 
    					        #faxnumber+=","
    					    #end 
    					    ##faxnumber+="<br>"
    				  #end
    		  #else 
    				 #faxnumber=detail.fax 
    			#end 
		      #formatting for fax no--
		  #25Feb2013------previous format----no longer use---refer 'phones' table---all fax no inserted into 'phones' table********
		      #formatting for address field--
      		rest, *last = detail.address.split("//")
      		unless last.blank? || last.nil? 
      		 	 last
      		end 
      		#formatting for address field-- 
		    
			data_array << { 
			               "<b>No</b>" => row_count+=1, 
											"<b>Company Name</b>" => compname,
											"<b>Contact Person</b>" => contactperson,
											"<b>Phone</b>" => telephone,
#											"<b>Fax</b>" => faxnumber,
											"<b>Address</b>" => rest.to_s + ' Postcode:' + last.to_s,
											"<b>Mail</b>" => detail.mail,
											"<b>Web</b>"=> detail.web}
       end
		end
		
		#table = PDF::SimpleTable.new
		PDF::SimpleTable.new do |table|
			table.data = data_array
			table.width = 800
  		table.title = "<b>Address Book Listing</b>"
  		#table.column_order = [ "<b>No</b>", "<b>Company Name</b>","<b>Contact Person</b>","<b>Phone</b>","<b>Fax</b>","<b>Address</b>","<b>Mail</b>","<b>Web</b>" ]
  		table.column_order = [ "<b>No</b>", "<b>Company Name</b>","<b>Contact Person</b>","<b>Phone</b>","<b>Address</b>","<b>Mail</b>","<b>Web</b>" ]
  		table.show_lines = :all
  		table.render_on(pdf)
		end		
		
		pdf.render
	end
end

