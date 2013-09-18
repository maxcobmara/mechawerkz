require 'spec_helper'

describe "contact_people/new" do
  before(:each) do
    assign(:contact_person, stub_model(ContactPerson,
      :name => "MyString",
      :company_id => "",
      :position => "MyString"
    ).as_new_record)
  end

  it "renders new contact_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_people_path, "post" do
      assert_select "input#contact_person_name[name=?]", "contact_person[name]"
      assert_select "input#contact_person_company_id[name=?]", "contact_person[company_id]"
      assert_select "input#contact_person_position[name=?]", "contact_person[position]"
    end
  end
end
