require 'spec_helper'

describe "contact_people/index" do
  before(:each) do
    assign(:contact_people, [
      stub_model(ContactPerson,
        :name => "Name",
        :company_id => "",
        :position => "Position"
      ),
      stub_model(ContactPerson,
        :name => "Name",
        :company_id => "",
        :position => "Position"
      )
    ])
  end

  it "renders a list of contact_people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
  end
end
