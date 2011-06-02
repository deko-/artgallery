require 'spec_helper'

describe "abouts/index.html.erb" do
  before(:each) do
    assign(:abouts, [
      stub_model(About,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(About,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of abouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
