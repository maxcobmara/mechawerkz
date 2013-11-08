require 'spec_helper'

describe "travel_requests/edit" do
  before(:each) do
    @travel_request = assign(:travel_request, stub_model(TravelRequest,
      :staff_id => 1,
      :document_id => 1,
      :own_car => false,
      :project_id => 1,
      :company_id => 1,
      :contact_person_id => 1,
      :is_submitted => false,
      :is_approved => false,
      :approved_by => 1
    ))
  end

  it "renders the edit travel_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", travel_request_path(@travel_request), "post" do
      assert_select "input#travel_request_staff_id[name=?]", "travel_request[staff_id]"
      assert_select "input#travel_request_document_id[name=?]", "travel_request[document_id]"
      assert_select "input#travel_request_own_car[name=?]", "travel_request[own_car]"
      assert_select "input#travel_request_project_id[name=?]", "travel_request[project_id]"
      assert_select "input#travel_request_company_id[name=?]", "travel_request[company_id]"
      assert_select "input#travel_request_contact_person_id[name=?]", "travel_request[contact_person_id]"
      assert_select "input#travel_request_is_submitted[name=?]", "travel_request[is_submitted]"
      assert_select "input#travel_request_is_approved[name=?]", "travel_request[is_approved]"
      assert_select "input#travel_request_approved_by[name=?]", "travel_request[approved_by]"
    end
  end
end
