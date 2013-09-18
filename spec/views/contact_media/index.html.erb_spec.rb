require 'spec_helper'

describe "contact_media/index" do
  before(:each) do
    assign(:contact_media, [
      stub_model(ContactMedium,
        :person_id => 1,
        :company_id => 2,
        :medium_type => 3,
        :medium => "Medium"
      ),
      stub_model(ContactMedium,
        :person_id => 1,
        :company_id => 2,
        :medium_type => 3,
        :medium => "Medium"
      )
    ])
  end

  it "renders a list of contact_media" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Medium".to_s, :count => 2
  end
end
