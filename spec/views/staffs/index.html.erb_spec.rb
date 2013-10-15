require 'spec_helper'

describe "staffs/index" do
  before(:each) do
    assign(:staffs, [
      stub_model(Staff,
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
      ),
      stub_model(Staff,
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
      )
    ])
  end

  it "renders a list of staffs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Kwsp Code".to_s, :count => 2
    assert_select "tr>td", :text => "Tax Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => "Citizenship".to_s, :count => 2
    assert_select "tr>td", :text => "Birth Cert".to_s, :count => 2
    assert_select "tr>td", :text => "Gravatar Email".to_s, :count => 2
    assert_select "tr>td", :text => "Blood Type".to_s, :count => 2
    assert_select "tr>td", :text => "Marital Status Type".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
  end
end
