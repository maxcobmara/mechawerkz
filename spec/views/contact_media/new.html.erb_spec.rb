require 'spec_helper'

describe "contact_media/new" do
  before(:each) do
    assign(:contact_medium, stub_model(ContactMedium,
      :person_id => 1,
      :company_id => 1,
      :medium_type => 1,
      :medium => "MyString"
    ).as_new_record)
  end

  it "renders new contact_medium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_media_path, "post" do
      assert_select "input#contact_medium_person_id[name=?]", "contact_medium[person_id]"
      assert_select "input#contact_medium_company_id[name=?]", "contact_medium[company_id]"
      assert_select "input#contact_medium_medium_type[name=?]", "contact_medium[medium_type]"
      assert_select "input#contact_medium_medium[name=?]", "contact_medium[medium]"
    end
  end
end
