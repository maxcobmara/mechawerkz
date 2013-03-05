class Uploadedfile < ActiveRecord::Base
  
  def self.app_file_content_type(input_file)
	file_content_type = input_file.content_type
	mimetype_excelx = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
	mimetype_excel = 'application/vnd.ms-excel'
	mimetype_ods = 'application/vnd.oasis.opendocument.spreadsheet'
	if (file_content_type == mimetype_excelx ) || (file_content_type == mimetype_excel) || (file_content_type == mimetype_ods)
		return file_content_type
	end
  end
  
  def self.from_user(input_file)
    p = self.new
    p.name = input_file.original_filename
    p.content_type = input_file.content_type  
    
    if p.valid?  
      p.save
    end
    return File.join("#{::Rails.root.to_s}/public/data/uploaded_files", p.name)
  end
  
end
