require "spec_helper"

describe TravelRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/travel_requests").should route_to("travel_requests#index")
    end

    it "routes to #new" do
      get("/travel_requests/new").should route_to("travel_requests#new")
    end

    it "routes to #show" do
      get("/travel_requests/1").should route_to("travel_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/travel_requests/1/edit").should route_to("travel_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/travel_requests").should route_to("travel_requests#create")
    end

    it "routes to #update" do
      put("/travel_requests/1").should route_to("travel_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/travel_requests/1").should route_to("travel_requests#destroy", :id => "1")
    end

  end
end
