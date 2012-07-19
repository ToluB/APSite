require "spec_helper"

describe PexamsController do
  describe "routing" do

    it "routes to #index" do
      get("/pexams").should route_to("pexams#index")
    end

    it "routes to #new" do
      get("/pexams/new").should route_to("pexams#new")
    end

    it "routes to #show" do
      get("/pexams/1").should route_to("pexams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pexams/1/edit").should route_to("pexams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pexams").should route_to("pexams#create")
    end

    it "routes to #update" do
      put("/pexams/1").should route_to("pexams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pexams/1").should route_to("pexams#destroy", :id => "1")
    end

  end
end
