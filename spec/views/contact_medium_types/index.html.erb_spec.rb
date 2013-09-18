require 'spec_helper'

describe "contact_medium_types/index" do
  before(:each) do
    assign(:contact_medium_types, [
      stub_model(ContactMediumType,
        :description => "Description"
      ),
      stub_model(ContactMediumType,
        :description => "Description"
      )
    ])
  end

  it "renders a list of contact_medium_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
