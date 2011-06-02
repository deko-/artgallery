require "spec_helper"

describe AboutsController do
  describe "routing" do

    it "routes to #index" do
      get("/abouts").should route_to("abouts#index")
    end

    it "routes to #new" do
      get("/abouts/new").should route_to("abouts#new")
    end

    it "routes to #show" do
      get("/abouts/1").should route_to("abouts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/abouts/1/edit").should route_to("abouts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/abouts").should route_to("abouts#create")
    end

    it "routes to #update" do
      put("/abouts/1").should route_to("abouts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/abouts/1").should route_to("abouts#destroy", :id => "1")
    end

  end
end
