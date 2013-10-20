require "spec_helper"

describe StaffPositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/staff_positions").should route_to("staff_positions#index")
    end

    it "routes to #new" do
      get("/staff_positions/new").should route_to("staff_positions#new")
    end

    it "routes to #show" do
      get("/staff_positions/1").should route_to("staff_positions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/staff_positions/1/edit").should route_to("staff_positions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/staff_positions").should route_to("staff_positions#create")
    end

    it "routes to #update" do
      put("/staff_positions/1").should route_to("staff_positions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/staff_positions/1").should route_to("staff_positions#destroy", :id => "1")
    end

  end
end
