require 'spec_helper'

describe "pexams/index" do
  before(:each) do
    assign(:pexams, [
      stub_model(Pexam,
        :name => "Name",
        :passrt => 1,
        :url => "Url"
      ),
      stub_model(Pexam,
        :name => "Name",
        :passrt => 1,
        :url => "Url"
      )
    ])
  end

  it "renders a list of pexams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
