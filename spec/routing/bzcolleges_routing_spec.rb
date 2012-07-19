require "spec_helper"

describe BzcollegesController do
  describe "routing" do

    it "routes to #index" do
      get("/bzcolleges").should route_to("bzcolleges#index")
    end

    it "routes to #new" do
      get("/bzcolleges/new").should route_to("bzcolleges#new")
    end

    it "routes to #show" do
      get("/bzcolleges/1").should route_to("bzcolleges#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bzcolleges/1/edit").should route_to("bzcolleges#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bzcolleges").should route_to("bzcolleges#create")
    end

    it "routes to #update" do
      put("/bzcolleges/1").should route_to("bzcolleges#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bzcolleges/1").should route_to("bzcolleges#destroy", :id => "1")
    end

  end
end
