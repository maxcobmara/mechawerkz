require 'spec_helper'

describe "documents/index" do
  before(:each) do
    assign(:documents, [
      stub_model(Document,
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
      ),
      stub_model(Document,
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
      )
    ])
  end

  it "renders a list of documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ref No".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Document File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Document Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
