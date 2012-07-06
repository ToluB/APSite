require 'spec_helper'

describe "Convos" do
  describe "GET /convos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get convos_path
      response.status.should be(200)
    end
    
    it "should be able to upmerit a conversation" do
      get new_user_registration_path
      page.should have_content "Sign up"
    end
  end
end
