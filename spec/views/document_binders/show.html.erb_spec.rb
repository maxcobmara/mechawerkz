require 'spec_helper'

describe "document_binders/show" do
  before(:each) do
    @document_binder = assign(:document_binder, stub_model(DocumentBinder,
      :code => "Code",
      :description => "Description",
      :volume => "Volume",
      :contact_company_id => 1,
      :owned_by => 2,
      :location_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Description/)
    rendered.should match(/Volume/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
