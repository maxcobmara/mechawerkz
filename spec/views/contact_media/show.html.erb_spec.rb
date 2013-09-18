require 'spec_helper'

describe "contact_media/show" do
  before(:each) do
    @contact_medium = assign(:contact_medium, stub_model(ContactMedium,
      :person_id => 1,
      :company_id => 2,
      :medium_type => 3,
      :medium => "Medium"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Medium/)
  end
end
