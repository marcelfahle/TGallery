require 'spec_helper'

describe "comments/show" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :text => "Text",
      :author_name => "Author Name",
      :author_email => "Author Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    rendered.should match(/Author Name/)
    rendered.should match(/Author Email/)
  end
end
