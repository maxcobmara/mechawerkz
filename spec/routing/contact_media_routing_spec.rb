require "spec_helper"

describe ContactMediaController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_media").should route_to("contact_media#index")
    end

    it "routes to #new" do
      get("/contact_media/new").should route_to("contact_media#new")
    end

    it "routes to #show" do
      get("/contact_media/1").should route_to("contact_media#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_media/1/edit").should route_to("contact_media#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_media").should route_to("contact_media#create")
    end

    it "routes to #update" do
      put("/contact_media/1").should route_to("contact_media#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_media/1").should route_to("contact_media#destroy", :id => "1")
    end

  end
end
