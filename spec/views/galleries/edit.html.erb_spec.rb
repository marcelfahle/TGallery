require 'spec_helper'

describe "galleries/edit" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :name => "MyString",
      :email => "MyString",
      :background => "MyString",
      :has_rating => false,
      :has_comments => false
    ))
  end

  it "renders the edit gallery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => galleries_path(@gallery), :method => "post" do
      assert_select "input#gallery_name", :name => "gallery[name]"
      assert_select "input#gallery_email", :name => "gallery[email]"
      assert_select "input#gallery_background", :name => "gallery[background]"
      assert_select "input#gallery_has_rating", :name => "gallery[has_rating]"
      assert_select "input#gallery_has_comments", :name => "gallery[has_comments]"
    end
  end
end
