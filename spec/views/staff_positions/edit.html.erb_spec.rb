require 'spec_helper'

describe "staff_positions/edit" do
  before(:each) do
    @staff_position = assign(:staff_position, stub_model(StaffPosition,
      :code => "MyString",
      :combo_code => "MyString",
      :name => "MyString",
      :unit => "MyString",
      :tasks_main => "MyText",
      :tasks_other => "MyText",
      :ancestry => "MyString",
      :ancestry_depth => 1,
      :is_acting => false,
      :staff_grade_min => 1,
      :staff_id => 1
    ))
  end

  it "renders the edit staff_position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", staff_position_path(@staff_position), "post" do
      assert_select "input#staff_position_code[name=?]", "staff_position[code]"
      assert_select "input#staff_position_combo_code[name=?]", "staff_position[combo_code]"
      assert_select "input#staff_position_name[name=?]", "staff_position[name]"
      assert_select "input#staff_position_unit[name=?]", "staff_position[unit]"
      assert_select "textarea#staff_position_tasks_main[name=?]", "staff_position[tasks_main]"
      assert_select "textarea#staff_position_tasks_other[name=?]", "staff_position[tasks_other]"
      assert_select "input#staff_position_ancestry[name=?]", "staff_position[ancestry]"
      assert_select "input#staff_position_ancestry_depth[name=?]", "staff_position[ancestry_depth]"
      assert_select "input#staff_position_is_acting[name=?]", "staff_position[is_acting]"
      assert_select "input#staff_position_staff_grade_min[name=?]", "staff_position[staff_grade_min]"
      assert_select "input#staff_position_staff_id[name=?]", "staff_position[staff_id]"
    end
  end
end
