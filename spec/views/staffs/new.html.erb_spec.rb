require 'spec_helper'

describe "staffs/new" do
  before(:each) do
    assign(:staff, stub_model(Staff,
      :id_no => "MyString",
      :name => "MyString",
      :kwsp_code => "MyString",
      :tax_code => "MyString",
      :access_id => 1,
      :title_id => 1,
      :file_id => 1,
      :user_id => 1,
      :state => 1,
      :country_code => "MyString",
      :citizenship => "MyString",
      :birth_cert => "MyString",
      :gravatar_email => "MyString",
      :blood_type => "MyString",
      :marital_status_type => "MyString",
      :race => 1,
      :religion => 1,
      :gender => "MyString"
    ).as_new_record)
  end

  it "renders new staff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", staffs_path, "post" do
      assert_select "input#staff_id_no[name=?]", "staff[id_no]"
      assert_select "input#staff_name[name=?]", "staff[name]"
      assert_select "input#staff_kwsp_code[name=?]", "staff[kwsp_code]"
      assert_select "input#staff_tax_code[name=?]", "staff[tax_code]"
      assert_select "input#staff_access_id[name=?]", "staff[access_id]"
      assert_select "input#staff_title_id[name=?]", "staff[title_id]"
      assert_select "input#staff_file_id[name=?]", "staff[file_id]"
      assert_select "input#staff_user_id[name=?]", "staff[user_id]"
      assert_select "input#staff_state[name=?]", "staff[state]"
      assert_select "input#staff_country_code[name=?]", "staff[country_code]"
      assert_select "input#staff_citizenship[name=?]", "staff[citizenship]"
      assert_select "input#staff_birth_cert[name=?]", "staff[birth_cert]"
      assert_select "input#staff_gravatar_email[name=?]", "staff[gravatar_email]"
      assert_select "input#staff_blood_type[name=?]", "staff[blood_type]"
      assert_select "input#staff_marital_status_type[name=?]", "staff[marital_status_type]"
      assert_select "input#staff_race[name=?]", "staff[race]"
      assert_select "input#staff_religion[name=?]", "staff[religion]"
      assert_select "input#staff_gender[name=?]", "staff[gender]"
    end
  end
end
