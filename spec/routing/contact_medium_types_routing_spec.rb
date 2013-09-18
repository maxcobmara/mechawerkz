require "spec_helper"

describe ContactMediumTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_medium_types").should route_to("contact_medium_types#index")
    end

    it "routes to #new" do
      get("/contact_medium_types/new").should route_to("contact_medium_types#new")
    end

    it "routes to #show" do
      get("/contact_medium_types/1").should route_to("contact_medium_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_medium_types/1/edit").should route_to("contact_medium_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_medium_types").should route_to("contact_medium_types#create")
    end

    it "routes to #update" do
      put("/contact_medium_types/1").should route_to("contact_medium_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_medium_types/1").should route_to("contact_medium_types#destroy", :id => "1")
    end

  end
end
