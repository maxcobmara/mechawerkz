require 'spec_helper'

describe "contact_medium_types/show" do
  before(:each) do
    @contact_medium_type = assign(:contact_medium_type, stub_model(ContactMediumType,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
