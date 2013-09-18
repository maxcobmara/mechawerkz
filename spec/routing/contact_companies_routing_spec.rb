require "spec_helper"

describe ContactCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_companies").should route_to("contact_companies#index")
    end

    it "routes to #new" do
      get("/contact_companies/new").should route_to("contact_companies#new")
    end

    it "routes to #show" do
      get("/contact_companies/1").should route_to("contact_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_companies/1/edit").should route_to("contact_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_companies").should route_to("contact_companies#create")
    end

    it "routes to #update" do
      put("/contact_companies/1").should route_to("contact_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_companies/1").should route_to("contact_companies#destroy", :id => "1")
    end

  end
end
