require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :code => "Code",
      :name => "Name",
      :customer_ref => "Customer Ref",
      :company_id => 1,
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/Customer Ref/)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
  end
end
