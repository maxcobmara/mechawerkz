require 'spec_helper'

describe "contact_people/show" do
  before(:each) do
    @contact_person = assign(:contact_person, stub_model(ContactPerson,
      :name => "Name",
      :company_id => "",
      :position => "Position"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/Position/)
  end
end
