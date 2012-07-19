require 'spec_helper'

describe "pexams/show" do
  before(:each) do
    @pexam = assign(:pexam, stub_model(Pexam,
      :name => "Name",
      :passrt => 1,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Url/)
  end
end
