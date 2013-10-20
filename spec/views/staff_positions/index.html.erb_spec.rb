require 'spec_helper'

describe "staff_positions/index" do
  before(:each) do
    assign(:staff_positions, [
      stub_model(StaffPosition,
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
      ),
      stub_model(StaffPosition,
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
      )
    ])
  end

  it "renders a list of staff_positions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Combo Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ancestry".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
