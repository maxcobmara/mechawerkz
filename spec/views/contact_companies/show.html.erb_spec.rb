require 'spec_helper'

describe "contact_companies/show" do
  before(:each) do
    @contact_company = assign(:contact_company, stub_model(ContactCompany,
      :name => "Name",
      :address => "MyText",
      :postcode => "Postcode",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Postcode/)
    rendered.should match(/State/)
  end
end
