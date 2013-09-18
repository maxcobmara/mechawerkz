require 'spec_helper'

describe "contact_medium_types/edit" do
  before(:each) do
    @contact_medium_type = assign(:contact_medium_type, stub_model(ContactMediumType,
      :description => "MyString"
    ))
  end

  it "renders the edit contact_medium_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_medium_type_path(@contact_medium_type), "post" do
      assert_select "input#contact_medium_type_description[name=?]", "contact_medium_type[description]"
    end
  end
end
