require 'spec_helper'

describe "contact_medium_types/new" do
  before(:each) do
    assign(:contact_medium_type, stub_model(ContactMediumType,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new contact_medium_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_medium_types_path, "post" do
      assert_select "input#contact_medium_type_description[name=?]", "contact_medium_type[description]"
    end
  end
end
