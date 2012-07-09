require 'spec_helper'

describe "docs/show" do
  before(:each) do
    @doc = assign(:doc, stub_model(Doc,
      :name => "Name",
      :description => "Description",
      :user_id => 1,
      :docable_id => 2,
      :docable_type => "Docable Type",
      :attachment => "Attachment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Docable Type/)
    rendered.should match(/Attachment/)
  end
end
