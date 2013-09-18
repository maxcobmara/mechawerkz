require 'spec_helper'

describe "contact_companies/index" do
  before(:each) do
    assign(:contact_companies, [
      stub_model(ContactCompany,
        :name => "Name",
        :address => "MyText",
        :postcode => "Postcode",
        :state => "State"
      ),
      stub_model(ContactCompany,
        :name => "Name",
        :address => "MyText",
        :postcode => "Postcode",
        :state => "State"
      )
    ])
  end

  it "renders a list of contact_companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
