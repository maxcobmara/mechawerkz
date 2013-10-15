require 'spec_helper'

describe "staffs/show" do
  before(:each) do
    @staff = assign(:staff, stub_model(Staff,
      :id_no => "Id No",
      :name => "Name",
      :kwsp_code => "Kwsp Code",
      :tax_code => "Tax Code",
      :access_id => 1,
      :title_id => 2,
      :file_id => 3,
      :user_id => 4,
      :state => 5,
      :country_code => "Country Code",
      :citizenship => "Citizenship",
      :birth_cert => "Birth Cert",
      :gravatar_email => "Gravatar Email",
      :blood_type => "Blood Type",
      :marital_status_type => "Marital Status Type",
      :race => 6,
      :religion => 7,
      :gender => "Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Id No/)
    rendered.should match(/Name/)
    rendered.should match(/Kwsp Code/)
    rendered.should match(/Tax Code/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/Country Code/)
    rendered.should match(/Citizenship/)
    rendered.should match(/Birth Cert/)
    rendered.should match(/Gravatar Email/)
    rendered.should match(/Blood Type/)
    rendered.should match(/Marital Status Type/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/Gender/)
  end
end
