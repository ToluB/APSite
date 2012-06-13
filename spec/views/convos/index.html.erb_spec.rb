require 'spec_helper'

describe "convos/index" do
  before(:each) do
    assign(:convos, [
      stub_model(Convo,
        :user_id => 1,
        :subject_id => 2,
        :merits => 3,
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Convo,
        :user_id => 1,
        :subject_id => 2,
        :merits => 3,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of convos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
