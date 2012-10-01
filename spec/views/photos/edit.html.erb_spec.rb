require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :caption => "MyString",
      :owner => "MyString",
      :image => "MyString",
      :is_active => false
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path(@photo), :method => "post" do
      assert_select "input#photo_caption", :name => "photo[caption]"
      assert_select "input#photo_owner", :name => "photo[owner]"
      assert_select "input#photo_image", :name => "photo[image]"
      assert_select "input#photo_is_active", :name => "photo[is_active]"
    end
  end
end
