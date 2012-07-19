require 'spec_helper'

describe "bzcolleges/new" do
  before(:each) do
    assign(:bzcollege, stub_model(Bzcollege,
      :name => "MyString",
      :region => "MyString",
      :state => "MyString",
      :usnrank => 1,
      :satmed => 1,
      :gpamed => 1.5,
      :acceptrate => 1.5,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new bzcollege form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bzcolleges_path, :method => "post" do
      assert_select "input#bzcollege_name", :name => "bzcollege[name]"
      assert_select "input#bzcollege_region", :name => "bzcollege[region]"
      assert_select "input#bzcollege_state", :name => "bzcollege[state]"
      assert_select "input#bzcollege_usnrank", :name => "bzcollege[usnrank]"
      assert_select "input#bzcollege_satmed", :name => "bzcollege[satmed]"
      assert_select "input#bzcollege_gpamed", :name => "bzcollege[gpamed]"
      assert_select "input#bzcollege_acceptrate", :name => "bzcollege[acceptrate]"
      assert_select "input#bzcollege_url", :name => "bzcollege[url]"
    end
  end
end
