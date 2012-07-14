require 'spec_helper'

describe "docs/index" do
  before(:each) do
    assign(:docs, [
      stub_model(Doc,
        :name => "Name",
        :description => "Description",
        :user_id => 1,
        :docable_id => 2,
        :docable_type => "Docable Type",
        :attachment => "Attachment"
      ),
      stub_model(Doc,
        :name => "Name",
        :description => "Description",
        :user_id => 1,
        :docable_id => 2,
        :docable_type => "Docable Type",
        :attachment => "Attachment"
      )
    ])
  end

  it "renders a list of docs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Docable Type".to_s, :count => 2
    assert_select "tr>td", :text => "Attachment".to_s, :count => 2
  end
end
