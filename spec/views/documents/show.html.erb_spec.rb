require 'spec_helper'

describe "documents/show" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :ref_no => "Ref No",
      :title => "Title",
      :project_id => 1,
      :document_category_id => 2,
      :type => "Type",
      :recieved_from => 3,
      :filed_by => 4,
      :addressed_to => 5,
      :description => "MyText",
      :binder_id => 6,
      :document_file_name => "Document File Name",
      :document_content_type => "Document Content Type",
      :document_file_size => 7
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ref No/)
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Type/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/MyText/)
    rendered.should match(/6/)
    rendered.should match(/Document File Name/)
    rendered.should match(/Document Content Type/)
    rendered.should match(/7/)
  end
end
