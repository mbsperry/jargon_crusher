require "spec_helper"

describe JargonFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/jargon_files").should route_to("jargon_files#index")
    end

    it "routes to #new" do
      get("/jargon_files/new").should route_to("jargon_files#new")
    end

    it "routes to #show" do
      get("/jargon_files/1").should route_to("jargon_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jargon_files/1/edit").should route_to("jargon_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jargon_files").should route_to("jargon_files#create")
    end

    it "routes to #update" do
      put("/jargon_files/1").should route_to("jargon_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jargon_files/1").should route_to("jargon_files#destroy", :id => "1")
    end

  end
end
