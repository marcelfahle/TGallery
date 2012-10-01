require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :caption => "Caption",
        :owner => "Owner",
        :image => "Image",
        :is_active => false
      ),
      stub_model(Photo,
        :caption => "Caption",
        :owner => "Owner",
        :image => "Image",
        :is_active => false
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
