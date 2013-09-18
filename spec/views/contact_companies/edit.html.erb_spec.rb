require 'spec_helper'

describe "contact_companies/edit" do
  before(:each) do
    @contact_company = assign(:contact_company, stub_model(ContactCompany,
      :name => "MyString",
      :address => "MyText",
      :postcode => "MyString",
      :state => "MyString"
    ))
  end

  it "renders the edit contact_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_company_path(@contact_company), "post" do
      assert_select "input#contact_company_name[name=?]", "contact_company[name]"
      assert_select "textarea#contact_company_address[name=?]", "contact_company[address]"
      assert_select "input#contact_company_postcode[name=?]", "contact_company[postcode]"
      assert_select "input#contact_company_state[name=?]", "contact_company[state]"
    end
  end
end
