require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :caption => "Caption",
      :owner => "Owner",
      :image => "Image",
      :is_active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Caption/)
    rendered.should match(/Owner/)
    rendered.should match(/Image/)
    rendered.should match(/false/)
  end
end
