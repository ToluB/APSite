require 'spec_helper'

describe "bzcolleges/show" do
  before(:each) do
    @bzcollege = assign(:bzcollege, stub_model(Bzcollege,
      :name => "Name",
      :region => "Region",
      :state => "State",
      :usnrank => 1,
      :satmed => 2,
      :gpamed => 1.5,
      :acceptrate => 1.5,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Region/)
    rendered.should match(/State/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Url/)
  end
end
