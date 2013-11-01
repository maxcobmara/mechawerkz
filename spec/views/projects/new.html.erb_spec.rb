require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :code => "MyString",
      :name => "MyString",
      :customer_ref => "MyString",
      :company_id => 1,
      :value => "9.99"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_code[name=?]", "project[code]"
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_customer_ref[name=?]", "project[customer_ref]"
      assert_select "input#project_company_id[name=?]", "project[company_id]"
      assert_select "input#project_value[name=?]", "project[value]"
    end
  end
end
