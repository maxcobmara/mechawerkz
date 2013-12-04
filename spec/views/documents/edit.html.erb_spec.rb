require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :ref_no => "MyString",
      :title => "MyString",
      :project_id => 1,
      :document_category_id => 1,
      :type => "",
      :recieved_from => 1,
      :filed_by => 1,
      :addressed_to => 1,
      :description => "MyText",
      :binder_id => 1,
      :document_file_name => "MyString",
      :document_content_type => "MyString",
      :document_file_size => 1
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_path(@document), "post" do
      assert_select "input#document_ref_no[name=?]", "document[ref_no]"
      assert_select "input#document_title[name=?]", "document[title]"
      assert_select "input#document_project_id[name=?]", "document[project_id]"
      assert_select "input#document_document_category_id[name=?]", "document[document_category_id]"
      assert_select "input#document_type[name=?]", "document[type]"
      assert_select "input#document_recieved_from[name=?]", "document[recieved_from]"
      assert_select "input#document_filed_by[name=?]", "document[filed_by]"
      assert_select "input#document_addressed_to[name=?]", "document[addressed_to]"
      assert_select "textarea#document_description[name=?]", "document[description]"
      assert_select "input#document_binder_id[name=?]", "document[binder_id]"
      assert_select "input#document_document_file_name[name=?]", "document[document_file_name]"
      assert_select "input#document_document_content_type[name=?]", "document[document_content_type]"
      assert_select "input#document_document_file_size[name=?]", "document[document_file_size]"
    end
  end
end
