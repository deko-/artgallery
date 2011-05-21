require 'spec_helper' 

describe ArtworksController do
  it "renders the index template" do
        get :index
        response.should render_template("index")
  end
  
  it "assigns @artworks" do
       artwork = Artwork.create
       get :index
       assigns(:artworks).should eq([artwork]) # checks that it can assign artworks
  end
end