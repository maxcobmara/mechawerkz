require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :code => "Code",
        :name => "Name",
        :customer_ref => "Customer Ref",
        :company_id => 1,
        :value => "9.99"
      ),
      stub_model(Project,
        :code => "Code",
        :name => "Name",
        :customer_ref => "Customer Ref",
        :company_id => 1,
        :value => "9.99"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Ref".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
