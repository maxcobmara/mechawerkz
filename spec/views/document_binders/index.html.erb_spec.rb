require 'spec_helper'

describe "document_binders/index" do
  before(:each) do
    assign(:document_binders, [
      stub_model(DocumentBinder,
        :code => "Code",
        :description => "Description",
        :volume => "Volume",
        :contact_company_id => 1,
        :owned_by => 2,
        :location_id => 3
      ),
      stub_model(DocumentBinder,
        :code => "Code",
        :description => "Description",
        :volume => "Volume",
        :contact_company_id => 1,
        :owned_by => 2,
        :location_id => 3
      )
    ])
  end

  it "renders a list of document_binders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Volume".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
