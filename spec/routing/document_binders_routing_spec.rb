require "spec_helper"

describe DocumentBindersController do
  describe "routing" do

    it "routes to #index" do
      get("/document_binders").should route_to("document_binders#index")
    end

    it "routes to #new" do
      get("/document_binders/new").should route_to("document_binders#new")
    end

    it "routes to #show" do
      get("/document_binders/1").should route_to("document_binders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/document_binders/1/edit").should route_to("document_binders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_binders").should route_to("document_binders#create")
    end

    it "routes to #update" do
      put("/document_binders/1").should route_to("document_binders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_binders/1").should route_to("document_binders#destroy", :id => "1")
    end

  end
end
