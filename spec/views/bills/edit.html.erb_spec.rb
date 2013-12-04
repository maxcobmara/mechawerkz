require 'spec_helper'

describe "bills/edit" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :project_id => 1,
      :pay_to => 1,
      :document_id => 1,
      :category_id => 1,
      :company_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders the edit bill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bill_path(@bill), "post" do
      assert_select "input#bill_project_id[name=?]", "bill[project_id]"
      assert_select "input#bill_pay_to[name=?]", "bill[pay_to]"
      assert_select "input#bill_document_id[name=?]", "bill[document_id]"
      assert_select "input#bill_category_id[name=?]", "bill[category_id]"
      assert_select "input#bill_company_id[name=?]", "bill[company_id]"
      assert_select "input#bill_amount[name=?]", "bill[amount]"
    end
  end
end
