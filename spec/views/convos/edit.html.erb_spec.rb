require 'spec_helper'

describe "convos/edit" do
  before(:each) do
    @convo = assign(:convo, stub_model(Convo,
      :user_id => 1,
      :subject_id => 1,
      :merits => 1,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit convo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => convos_path(@convo), :method => "post" do
      assert_select "input#convo_user_id", :name => "convo[user_id]"
      assert_select "input#convo_subject_id", :name => "convo[subject_id]"
      assert_select "input#convo_merits", :name => "convo[merits]"
      assert_select "input#convo_title", :name => "convo[title]"
      assert_select "textarea#convo_content", :name => "convo[content]"
    end
  end
end
