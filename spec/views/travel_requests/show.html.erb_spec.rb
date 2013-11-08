require 'spec_helper'

describe "travel_requests/show" do
  before(:each) do
    @travel_request = assign(:travel_request, stub_model(TravelRequest,
      :staff_id => 1,
      :document_id => 2,
      :own_car => false,
      :project_id => 3,
      :company_id => 4,
      :contact_person_id => 5,
      :is_submitted => false,
      :is_approved => false,
      :approved_by => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/6/)
  end
end
