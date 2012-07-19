require 'spec_helper'

describe "bzcolleges/index" do
  before(:each) do
    assign(:bzcolleges, [
      stub_model(Bzcollege,
        :name => "Name",
        :region => "Region",
        :state => "State",
        :usnrank => 1,
        :satmed => 2,
        :gpamed => 1.5,
        :acceptrate => 1.5,
        :url => "Url"
      ),
      stub_model(Bzcollege,
        :name => "Name",
        :region => "Region",
        :state => "State",
        :usnrank => 1,
        :satmed => 2,
        :gpamed => 1.5,
        :acceptrate => 1.5,
        :url => "Url"
      )
    ])
  end

  it "renders a list of bzcolleges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
