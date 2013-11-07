require 'spec_helper'

describe "bills/index" do
  before(:each) do
    assign(:bills, [
      stub_model(Bill,
        :project_id => 1,
        :pay_to => 2,
        :document_id => 3,
        :category_id => 4,
        :company_id => 5,
        :amount => "9.99"
      ),
      stub_model(Bill,
        :project_id => 1,
        :pay_to => 2,
        :document_id => 3,
        :category_id => 4,
        :company_id => 5,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of bills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
