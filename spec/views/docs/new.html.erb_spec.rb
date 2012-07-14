require 'spec_helper'

describe "docs/new" do
  before(:each) do
    assign(:doc, stub_model(Doc,
      :name => "MyString",
      :description => "MyString",
      :user_id => 1,
      :docable_id => 1,
      :docable_type => "MyString",
      :attachment => "MyString"
    ).as_new_record)
  end

  it "renders new doc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => docs_path, :method => "post" do
      assert_select "input#doc_name", :name => "doc[name]"
      assert_select "input#doc_description", :name => "doc[description]"
      assert_select "input#doc_user_id", :name => "doc[user_id]"
      assert_select "input#doc_docable_id", :name => "doc[docable_id]"
      assert_select "input#doc_docable_type", :name => "doc[docable_type]"
      assert_select "input#doc_attachment", :name => "doc[attachment]"
    end
  end
end
