require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :code => "MyString",
      :name => "MyString",
      :customer_ref => "MyString",
      :company_id => 1,
      :value => "9.99"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_path(@project), "post" do
      assert_select "input#project_code[name=?]", "project[code]"
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_customer_ref[name=?]", "project[customer_ref]"
      assert_select "input#project_company_id[name=?]", "project[company_id]"
      assert_select "input#project_value[name=?]", "project[value]"
    end
  end
end
