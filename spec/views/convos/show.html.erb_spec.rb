require 'spec_helper'

describe "convos/show" do
  before(:each) do
    @convo = assign(:convo, stub_model(Convo,
      :user_id => 1,
      :subject_id => 2,
      :merits => 3,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
