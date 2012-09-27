require 'spec_helper'

describe "galleries/show" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :name => "Name",
      :email => "Email",
      :background => "Background",
      :has_rating => false,
      :has_comments => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Background/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
