require "spec_helper"

describe ConvosController do
  describe "routing" do

    it "routes to #index" do
      get("/convos").should route_to("convos#index")
    end

    it "routes to #new" do
      get("/convos/new").should route_to("convos#new")
    end

    it "routes to #show" do
      get("/convos/1").should route_to("convos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/convos/1/edit").should route_to("convos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/convos").should route_to("convos#create")
    end

    it "routes to #update" do
      put("/convos/1").should route_to("convos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/convos/1").should route_to("convos#destroy", :id => "1")
    end

  end
end
