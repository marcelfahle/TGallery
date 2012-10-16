require 'spec_helper'

describe "comments/index" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :text => "Text",
        :author_name => "Author Name",
        :author_email => "Author Email"
      ),
      stub_model(Comment,
        :text => "Text",
        :author_name => "Author Name",
        :author_email => "Author Email"
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Author Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author Email".to_s, :count => 2
  end
end
