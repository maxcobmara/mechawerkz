require 'spec_helper'

describe "travel_requests/index" do
  before(:each) do
    assign(:travel_requests, [
      stub_model(TravelRequest,
        :staff_id => 1,
        :document_id => 2,
        :own_car => false,
        :project_id => 3,
        :company_id => 4,
        :contact_person_id => 5,
        :is_submitted => false,
        :is_approved => false,
        :approved_by => 6
      ),
      stub_model(TravelRequest,
        :staff_id => 1,
        :document_id => 2,
        :own_car => false,
        :project_id => 3,
        :company_id => 4,
        :contact_person_id => 5,
        :is_submitted => false,
        :is_approved => false,
        :approved_by => 6
      )
    ])
  end

  it "renders a list of travel_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
