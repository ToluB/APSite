require 'spec_helper'

describe "pexams/edit" do
  before(:each) do
    @pexam = assign(:pexam, stub_model(Pexam,
      :name => "MyString",
      :passrt => 1,
      :url => "MyString"
    ))
  end

  it "renders the edit pexam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pexams_path(@pexam), :method => "post" do
      assert_select "input#pexam_name", :name => "pexam[name]"
      assert_select "input#pexam_passrt", :name => "pexam[passrt]"
      assert_select "input#pexam_url", :name => "pexam[url]"
    end
  end
end
