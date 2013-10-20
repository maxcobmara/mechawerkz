require 'spec_helper'

describe "staff_positions/show" do
  before(:each) do
    @staff_position = assign(:staff_position, stub_model(StaffPosition,
      :code => "Code",
      :combo_code => "Combo Code",
      :name => "Name",
      :unit => "Unit",
      :tasks_main => "MyText",
      :tasks_other => "MyText",
      :ancestry => "Ancestry",
      :ancestry_depth => 1,
      :is_acting => false,
      :staff_grade_min => 2,
      :staff_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Combo Code/)
    rendered.should match(/Name/)
    rendered.should match(/Unit/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Ancestry/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
